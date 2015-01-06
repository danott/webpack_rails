Rails.application.routes.draw do

  mount WebpackRails::Engine => "/webpack_rails"
end
