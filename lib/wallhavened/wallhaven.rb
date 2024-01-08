require "open-uri"
require "nokogiri"
require "json"

class Wallhaven
  SITE_URL = "https://wallhaven.cc".freeze
  SITE_API = "#{SITE_URL}/api/v1".freeze
end

  # def download_collection(collection_id)
  #   url = "#{SITE_API}/collections/#{}"
  #   doc =
  # end

  # def download_collection(collection)
  #   url = "#{SITE_URL}/user/#{@user}/favorites/#{collection}"
  #   doc = Nokogiri::HTML(URI.open(url))

  #   urls = []
  #   doc.css('.preview').map {|t| t['href']}.each do |url|
  #     urls << WallhavenWallpaper.new(url)
  #   end

  #   return urls
  # end



class WallhavenAuth < Wallhaven
  def initialize(username, api_key)
    @username = username
    @api_key = api_key
    super()
  end

  def get_user_collections
    url = "#{SITE_API}/collections?apikey=#{@api_key}"
    JSON.parse(URI.parse(url).open.read)["data"]
  end

  def scrape_collection(id)
    url = "#{SITE_API}/collections/#{@username}/#{id}?page="

    page = 1
    walls = []
    loop do
      begin
        json = JSON.parse(URI.parse(url + page.to_s).open.read)
      rescue OpenURI::HTTPError => e
        raise e unless e.to_s.include?("429")

        puts("Delaying for 10s")
        sleep(10)
        retry
      end

      max_page ||= json["meta"]["last_page"]

      json["data"].each do |wallpaper|
        walls << WallhavenWallpaper.new(wallpaper["path"])
      end

      break if page == max_page

      page += 1
      sleep 1.4
    end

    walls
  end

  def scrape_user_collections
    collections = get_user_collections
    walls = []
    collections.each do |collection|
      id = collection["id"]
      puts id
      walls.push(*scrape_collection(id))
    end
    walls
  end
end

class WallhavenWallpaper
  SITE_URL = "https://wallhaven.cc".freeze
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def download(path)
    
  end
end
