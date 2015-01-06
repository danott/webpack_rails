webpack_rails
-------------

# Installation

Add `webpack_rails` to your Gemfile

```ruby
gem 'webpack_rails'
```

Install the default webpack configuration

```
rails generate webpack_rails:install
```

Install webpack using node

```
npm install
```

Update asset tags

```ruby
# Sprockets
javascript_include_tag('application')

# Webpack
webpack_include_tag('application.js') # Note the appending of '.js'
```

Mount the engine at 'webpack'

```ruby
mount WebpackRails::Engine, at: "webpack"
```

## Running in development

In development, you'll want to use [Webpack's development server][]. Assuming your `$PATH` is set up to find node executables, this is simply:

```bash
webpack-dev-server # assuming your $PATH is setup to find executables from node
```

## Running in production

Similar to `rake assets:precompile`, there is `rake webpack:precompile`. Assets are saved to `public/webpack/#{entry}`. (Again, note that `entry` will include ".js")

# Adding entry points

In Sprockets, you add a new file to `assets.precompile`. With webpack, you just add a new entry point in `webpack.config.js`.

## Stylesheets?

I have expirimented with stylesheets, and it is possible to get them working. However, early on it's kind of rough, so I'm focusing on making JS work well for now. Using webpack sass/style loaders, it can be achieved in JS pretty easily.

## License

This project rocks and uses MIT-LICENSE.
