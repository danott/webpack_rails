module WebpackRails
  class Entries
    class WebpackError < RuntimeError; end

    class_attribute :_entries
    class_attribute :_loaded

    self._entries = Hash.new do |hash, key|
      raise WebpackError.new "Unknown webpack entry: '#{key}', the named entries from 'webpack.config.js' are: #{hash.keys}. If you recently added this entry, you will need to restart the rails application."
    end

    def self.[](key)
      unless self._loaded?
        self.load
        self._loaded = true
      end

      _entries[key]
    end

    def self.load
      unless File.exist?(webpack_entries_manifest_fullpath)
        raise WebpackError.new "Webpack entries manifest doesn't exist. 'rake webpack:precompile'"
      end

      self._entries = _entries.clear.merge(JSON.load(webpack_entries_manifest_fullpath))
    end

    def self.webpack_entries_manifest_fullpath
      WebpackRails.config.root.join('public/webpack/manifest.json')
    end
  end
end
