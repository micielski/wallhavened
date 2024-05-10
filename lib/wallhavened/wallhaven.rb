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

class WallhavenAuth < Wallhaven
  def initialize(username, api_key)
    @username = username
    @api_key = api_key
    super()
  end

  def scrape_user_collections
    user_collections_ids.flat_map { |collection| scrape_collection(collection) }
  end

  def user_collections_ids
    url = "#{SITE_API}/collections?apikey=#{@api_key}"
    ids = []
    @request_sender.get_json(url)["data"].each do |collection|
      ids << collection["id"]
    end
    ids
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

class WallhavenWallpaper
  SITE_URL = "https://wallhaven.cc".freeze
  attr_reader :url

  def initialize(img_url, id)
    @img_url = img_url
    @id = id
    @filename = img_url.split("/")[-1]
    puts @filename
  end

  def download(path)
    output_path = "#{path}/#{@filename}"
    URI.parse(@img_url).open do |image|
      File.binwrite(output_path, image.read)
    end
  end
end
