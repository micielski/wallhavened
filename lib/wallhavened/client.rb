require_relative "utils/request_sender"

module Wallhavened
  class Client
    def initialize
      @request_sender = Wallhavened::Utils::RequestSender.new
    end
  end
end
