require 'webpack_rails/config'
require 'webpack_rails/entries'

module WebpackRails
  class Engine < ::Rails::Engine
    isolate_namespace WebpackRails

    initializer "WebpackRails.load_app_root" do |app|
      WebpackRails.config.root = app.root
    end

    initializer 'WebpackRails.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper WebpackRails::AssetTagHelper
      end
    end
  end
end
