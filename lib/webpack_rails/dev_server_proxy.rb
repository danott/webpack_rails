module WebpackRails
  class DevServerProxy
    def self.call(env)
      new(env).call
    end

    attr_reader :env
    def initialize(env)
      @env = env
    end

    def call
      begin
        rack_webpack_response
      rescue Errno::ECONNREFUSED
        notify_console
      end
    end

    private

    def rack_webpack_response
      [webpack_response.code, webpack_response_headers, [webpack_response.body]]
    end

    def notify_console
      ['200', {'content-type' => 'application/javascript'}, [%Q[
      console.info("Rails is configured to use the Webpack Dev Server, but the Webpack Dev Server isn't running!");
      console.info("Install with 'npm install'.");
      console.info("Run with 'webpack-dev-server'.");
                                                             ]]]
    end

    def webpack_response_headers
      Hash[webpack_response.each_header.to_a].slice('content-type')
    end

    def webpack_response
      @webpack_response ||= Net::HTTP.get_response(webpack_request_uri)
    end

    def webpack_request_uri
      URI.parse("http://localhost:8080#{entry_name}")
    end

    def entry_name
      env["PATH_INFO"].gsub(%r[^/webpack-dev-server], '')
    end
  end
end
