require_relative "wallhaven_wallpaper"

require "open-uri"
require "nokogiri"
require "json"

class RequestSender
  def get_json(url)
    begin
      json = JSON.parse(URI.parse(url).open.read)
    rescue OpenURI::HTTPError => e
      raise e unless e.to_s.include?("429")
      puts("Delaying for 10s")
      sleep(10)
      retry
    end
    json
  end
end

class Wallhaven
  SITE_URL = "https://wallhaven.cc".freeze
  SITE_API = "#{SITE_URL}/api/v1".freeze

  def initialize
    @request_sender = RequestSender.new
  end
end

class Collection
  attr_reader :id, :label

  def initialize(id, label)
    @id = id
    @label = label
  end
end

class WallhavenAuth < Wallhaven
  def initialize(username, api_key)
    @username = username
    @api_key = api_key
    super()
  end

  def scrape_all_user_collections
    user_collections.flat_map { |collection| scrape_collection(collection.id) }
  end

  def user_collections
    url = "#{SITE_API}/collections?apikey=#{@api_key}"
    collections = []
    @request_sender.get_json(url)["data"].each do |collection|
      collection = Collection.new(collection["id"], collection["label"])
      yield collection if block_given?
      collections << collection
    end
    collections
  end

  def scrape_collection(id)
    max_page = collection_pages_count(id)
    walls = []
    (1..max_page).each do |page|
      walls += scrape_collection_page(id, page)
      sleep 1.4
    end
    walls
  end

  def collection_pages_count(id)
    url = "#{SITE_API}/collections/#{@username}/#{id}?page=1"
    json = @request_sender.get_json(url)
    json["meta"]["last_page"]
  end

  def scrape_collection_page(id, page)
    url = "#{SITE_API}/collections/#{@username}/#{id}?page=#{page}"
    json = @request_sender.get_json(url)
    json["data"].map { |wallpaper| WallhavenWallpaper.new(wallpaper["path"], wallpaper["id"]) }
  end
end
