WebpackRails::Engine.routes.draw do
  get 'dev-server/*entry', to: 'entries#dev_server'
  get '*entry', to: 'entries#precompile_miss'
end
