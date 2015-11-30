// webpack.config.js
var webpack = require("webpack");
var path = require("path");
var railsRoot = path.join(__dirname, ".")
var railsAssetPaths = require("./.webpack.rails_asset_paths.json"); // rake webpack_rails:write_asset_paths_json

module.exports = {
  context: railsRoot,
  entry: {
    'application.js': 'application.js',
  },
  output: {
    filename: '[name]',
    path: './public/webpack'
  },
  resolve: {
    root: [
      path.join(railsRoot, './app/assets/javascripts'),
      path.join(railsRoot, './vendor/assets/javascripts'),
    ],
    fallback: railsAssetPaths,
    extensions: ['', '.js', '.jsx', '.coffee']
  },
  module: {
    loaders: [
      { test: /\.jsx?$/, exclude: [/node_modules/, /vendor/], loader: 'babel-loader' },
      { test: /\.coffee$/, exclude: [/node_modules/, /vendor/], loader: 'coffee' },
    ]
  },
  cache: true,
  watchDelay: 0,
  devtool: 'source-map',
  devServer: {
    contentBase: path.join(railsRoot, './public')
  }
};
