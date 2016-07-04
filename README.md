webpack_rails
-------------

# Philosophy

Before you use this tool, it will be helpful to understand what it's goals are, and aren't.

`webpack_rails` is built to be used beside `sprockets-rails`, or in place of `sprockets-rails`, but not within `sprockets-rails`.

Some of the pain with managing JavaScript dependencies in Rails comes from trying to shove NPM thinking inside of Sprockets thinking, which are completely different. Building a system with support for two different paradigms is not the goal of this project.

If it's helpful, it can be thought of this way - we're trying to build an alternative asset pipeline, that lives at `/webpack` instead of `/assets`. This avoids running into unexpected behavior, while providing clear division of labor between the tools.

# Installation

Add `webpack_rails` to your Gemfile

```ruby
gem 'webpack_rails', '~> 1.0.0.pre', github: 'danott/webpack_rails'
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
# Within your views

# Sprockets
javascript_include_tag('application')

# Webpack
webpack_include_tag('application.js') # Note the appending of '.js'
```

Mount the engine at 'webpack' as 'webpack'

```ruby
# Within your routes.rb
mount WebpackRails::Engine, at: 'webpack', as: 'webpack'
```

## Running in development

In development, you'll use [Webpack's development server][]. There's a rake task to ensure your Rails configuration gets cascaded down to `webpack-dev-server` correctly.

```bash
rake webpack_rails:dev_server
```

## Running in production

Similar to `rake assets:precompile`, there is `rake webpack_rails:precompile`. Assets are saved to `public/webpack/#{digest}-#{entry}`. (Again, note that `entry` will include ".js")

# Adding entry points

In Sprockets, you add a new file to `Rails.application.assets.precompile`.

With webpack, you add a new entry point in `webpack.config.js`.

# Configuration

```ruby
# In [environment].rb
config.webpack_rails.use_dev_server = (Rails.environment.development? || Rails.environment.test?)
config.webpack_rails.dev_server_port = 8080
```

# Using assets from Gems

The generated `webpack.config.js` includes affordances for grabbing assets from Ruby Gems.

Basically, if you're importing anything from sprockets, you'll want to use the `script-loader`. While this is possible, it's best to move as many things as you can to being managed by npm and Webpack.

Sometimes you may run into a Gem provided asset that has deep Sprocket's directives. In this scenario, my best advice is to grab the precompiled asset from sprockets via `http://rails-app.dev/assets/some-asset.js`, and copy into your vendor folder at `vendor/assets/javascripts/some-asset.js`,  and import it using the script-loader via `require('script!some-asset.js')`.

## License

This project rocks and uses MIT-LICENSE.

[reaction]: http://github.com/danott/reaction
[Webpack's development server]: http://webpack.github.io/docs/webpack-dev-server.html
