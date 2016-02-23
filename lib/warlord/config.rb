require 'yaml'

module Warlord
  module Config

    CONFIG_DIR = File.join(File.dirname(__FILE__), '..', '..', 'config').freeze

    def load(file_name)
      if file_name.include?('config/')
        file_name.sub!('config/', '')
      end

      config_file = File.join(CONFIG_DIR, file_name)
      YAML.load_file(config_file)
    rescue => e
      puts "Cannot load config file #{file_name || ''}"
      puts e.message
      nil
    end

    module_function :load
  end
end