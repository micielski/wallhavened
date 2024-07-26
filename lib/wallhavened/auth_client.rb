require_relative "collection"
require "json"
require "nokogiri"

module Wallhavened
  class AuthClient < Client
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
      json["data"].map { |wallpaper| Wallpaper.new(wallpaper["path"], wallpaper["id"]) }
    end
  end
end
