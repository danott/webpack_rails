module WebpackRails
  class Precompiled
    class NotPrecompiledError < RuntimeError; end
    class NotFoundError < RuntimeError; end

    class_attribute :_entries
    class_attribute :_loaded

    self._entries = Hash.new do |hash, entry|
      raise NotFoundError.new "Unknown webpack entry: '#{entry}', the named entries from the generated 'manifest.json' are: #{hash.keys}. If you recently added this entry, you will need to restart the rails application."
    end

    def self.[](entry)
      unless self._loaded
        self.load
        self._loaded = true
      end

      _entries[entry]
    end

    def self.load
      unless File.exist?(webpack_entries_manifest_fullpath)
        raise NotPrecompiledError.new "The webpack entries manifest doesn't exist. 'rake webpack:precompile'"
      end

      self._entries = _entries.clear.merge(JSON.load(webpack_entries_manifest_fullpath))
    end

    def self.webpack_entries_manifest_fullpath
      WebpackRails.config.root.join('public/webpack/manifest.json')
    end
  end
end
