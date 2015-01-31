module WebpackRails
  module AssetTagHelper
    def webpack_include_tag(entry)
      if WebpackRails.config.dev_server
        javascript_include_tag("/webpack/dev-server/#{entry}")
      else
        javascript_include_tag("/webpack/#{WebpackRails::Precompiled[entry]}")
      end
    end
  end
end
