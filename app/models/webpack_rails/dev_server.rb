module WebpackRails
  class DevServer
    def self.[](entry)
      new(entry).to_s
    rescue Errno::ECONNREFUSED
    end

    attr_reader :entry

    def initialize(entry)
      @entry = entry
    end

    def to_s
      webpack_response.body
    end

    private

    def webpack_response
      @webpack_response ||= Net::HTTP.get_response(webpack_request_uri)
    end

    def webpack_request_uri
      URI.parse("http://localhost:8080/#{entry}")
    end
  end
end
