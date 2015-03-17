namespace :webpack_rails do
  require 'rake/clean'
  CLOBBER.include("public/webpack/*")

  desc "Precompile assets using Webpack."
  task :precompile do
    mkdir_p "public/webpack"
    sh "./node_modules/.bin/webpack --config webpack.precompile.js"
  end

  task :dev_server do
    sh %q[./node_modules/.bin/webpack-dev-server --port $(rails runner "puts WebpackRails.config.dev_server_port")]
  end
end
