webpack_rails
-------------

WORK IN PROGRESS. CONTRIBUTIONS WELCOME.

Use Webpack in place of Sprockets.

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
# Sprockets
javascript_include_tag('application')

# Webpack
webpack_include_tag('application.js') # Note the appending of '.js'
```

Mount the engine at 'webpack'

```ruby
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

In Sprockets, you add a new file to `assets.precompile`. With webpack, you just add a new entry point in `webpack.config.js`.

# Configuration

```ruby
# In [environment].rb or an initializer
WebpackRails.setup do |config|
  config.use_dev_server = (Rails.environment.development? || Rails.environment.test?)
  config.dev_server_port = 8080
end
```

## License

This project rocks and uses MIT-LICENSE.

[reaction]: http://github.com/danott/reaction
[Webpack's development server]: http://webpack.github.io/docs/webpack-dev-server.html
