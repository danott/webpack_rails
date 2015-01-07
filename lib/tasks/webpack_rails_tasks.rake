WebpackRails.config.rake = true

namespace :webpack do
  require 'rake/clean'
  CLOBBER.include("public/webpack/*")

  desc "Precompile assets using Webpack."
  task :precompile do
    mkdir_p "public/webpack"
    sh "webpack --config webpack.precompile.js"
  end
end
