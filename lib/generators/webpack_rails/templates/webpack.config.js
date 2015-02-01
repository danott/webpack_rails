var execSync = require("exec-sync");
var path = require('path');
var railsRoot = path.join(__dirname, '.')
var railsAssetPaths = JSON.parse(execSync('rails runner "puts Rails.application.assets.paths.to_json"'))

module.exports = {
  context: railsRoot,
  entry: {
    'application.js': 'application.js'
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
    extensions: ['', '.js']
  },
  module: {
    loaders: [
      { test: /\.js?$/, exclude: [/node_modules/, /vendor/], loader: '6to5-loader' },
    ]
  },
  cache: true,
  watchDelay: 0,
  devtool: 'source-map',
  devServer: {
    contentBase: path.join(railsRoot, './public')
  },
};
