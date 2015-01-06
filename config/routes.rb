WebpackRails::Engine.routes.draw do
  get "dev-server/*entry", to: WebpackRails::DevServerProxy
  get "*entry", to: WebpackRails::PrecompileMissNotifier
end
