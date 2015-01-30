module WebpackRails
  mattr_accessor :config
  self.config = ActiveSupport::OrderedOptions.new do |config|
    config.dev_server = (Rails.env.development? || Rails.env.test?)
  end
end
