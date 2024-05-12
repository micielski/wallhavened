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
