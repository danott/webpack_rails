module WebpackRails
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install_everything
      copy_file "package.json"
      copy_file "webpack.config.js"
      copy_file "webpack.precompile.js"
      append_to_file ".gitignore", "node_modules"
    end
  end
end
