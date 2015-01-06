module WebpackRails
  mattr_accessor :config
  self.config = ActiveSupport::OrderedOptions.new
  self.config.dev_server = Rails.env.development?
end
