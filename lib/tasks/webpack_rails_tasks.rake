namespace :webpack_rails do
  require "rake/clean"
  CLOBBER.include("public/webpack/*")

  desc "Precompile assets using Webpack."
  task precompile: :write_asset_paths_json do
    mkdir_p "public/webpack"
    sh "./node_modules/.bin/webpack -p --config webpack.precompile.js"
  end

  task dev_server: :write_asset_paths_json do
    sh "./node_modules/.bin/webpack-dev-server --port #{WebpackRails.config.dev_server_port}"
  end

  task write_asset_paths_json: :environment do
    File.write(
      Rails.root.join(".webpack.rails_asset_paths.json"),
      Rails.application.assets.paths.to_json
    )
  end
end
