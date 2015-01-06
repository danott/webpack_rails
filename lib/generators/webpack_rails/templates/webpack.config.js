// Common webpack configuration used by webpack.hot.config and webpack.bundle.config.

var path = require("path");
var railsRoot = path.join(__dirname, '.')

module.exports = {
  context: railsRoot,
  entry: {
    'application.js': "./app/assets/javascripts/application.js",
  },
  output: {
    filename: "[name]",
    path: "./public/webpack"
  },
  resolve: {
    root: [
      path.join(railsRoot, "./app/assets/javascripts"),
      path.join(railsRoot, "./vendor/assets/javascripts"),
      // If you want to venture into Stylesheets, uncomment these lines
      // path.join(railsRoot, "./app/assets/stylesheets"),
      // path.join(railsRoot, "./vendor/assets/stylesheets"),
    ],
    // Stylesheets: append ".css", ".scss" to this array
    extensions: ["", ".js", ".jsx"]
  },
  module: {
    loaders: [
      { test: /\.js$/,   loader: "es6" },
      { test: /\.jsx$/,  loader: "es6!jsx?harmony" },
    ]
  },
  cache: false,
  devServer: {
    contentBase: path.join(railsRoot, './public')
  },
};
