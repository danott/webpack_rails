module WebpackRails
  class EntriesController < ActionController::Base
    rescue_from DevServer::NotRunning, with: -> {
      render :dev_server_not_running
    }

    def dev_server
      WebpackRails::DevServer[entry_name].tap do |http_response|
        if http_response.code == '200'
          render js: http_response.body
        else
          render :dev_server_entry_not_found
        end
      end
    end

    def precompile_miss
    end

    private

    def entry_name
      "#{params[:entry]}.#{params[:format]}"
    end
    helper_method :entry_name
  end
end
