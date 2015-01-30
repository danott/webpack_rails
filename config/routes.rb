WebpackRails::Engine.routes.draw do
  get 'dev-server/*entry', to: 'application#dev_server'
  get '*entry', to: 'application#precompile_miss'
end
