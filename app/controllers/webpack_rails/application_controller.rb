module WebpackRails
  class ApplicationController < ActionController::Base
    def dev_server
      entry_content = WebpackRails::DevServer[entry_name]

      if entry_content.present?
        render js: entry_content
      else
        render 'dev_server_not_running'
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
