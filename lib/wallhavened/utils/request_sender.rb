require "open-uri"

module Wallhavened
  module Utils
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
  end
end
