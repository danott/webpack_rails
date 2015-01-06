module WebpackRails
  class PrecompileMissNotifier
    def self.call(env)
      new(env).call
    end

    attr_reader :env
    def initialize(env)
      @env = env
    end

    def call
      ['200', {'content-type' => 'application/javascript'}, [%Q[
      console.info("Missing precompiled webpack entry '#{entry_name}'.");
      console.info("Expected to find '#{entry_name}' precompiled at '(Rails.root)/public/webpack/#{entry_name}', but it wasn't there.");
                                                             ]]]
    end

    def entry_name
      env["PATH_INFO"].gsub(%r[^/webpack/], '')
    end
  end
end
