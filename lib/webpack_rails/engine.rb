module WebpackRails
  class << self
    mattr_accessor :config
    self.config = ActiveSupport::OrderedOptions.new
    self.config.use_dev_server = (Rails.env.development? || Rails.env.test?)
    self.config.dev_server_port = 8080 # Webpack default
  end

  def self.setup(&block)
    yield self.config
  end

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
