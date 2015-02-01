module WebpackRails
  class DevServer
    class NotRunning < RuntimeError; end;

    def self.[](entry)
      new(entry).webpack_response
    rescue Errno::ECONNREFUSED
      raise NotRunning
    end

    attr_reader :entry

    def initialize(entry)
      @entry = entry
    end

    def webpack_response
      @webpack_response ||= Net::HTTP.get_response(webpack_request_uri)
    end

    private

    def webpack_request_uri
      URI.parse("http://localhost:#{WebpackRails.config.dev_server_port}/#{entry}")
    end
  end
end
