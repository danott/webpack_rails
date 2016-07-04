$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webpack_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webpack_rails"
  s.version     = WebpackRails::VERSION
  s.authors     = ["Dan Ott"]
  s.email       = ["thedanielott@gmail.com"]
  s.homepage    = ""
  s.summary     = "Use Webpack to build assets in Rails."
  s.description = "Use Webpack to build assets in Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails" #, "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
