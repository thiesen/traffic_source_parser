require 'uri'

module TrafficSourceParser
  module Parser
    module Tools
      def get_params(query)
        query.scan(/(\w+=[^&|\|]*)/).flatten
      end

      def parse_params(params_array)
        params_array.map { |param| param.split('=') }.
        delete_if { |params| params.size != 2 }.to_h
      end

      def translate_keys(hash, mapper)
        translated_hash = {}
        hash.each do |key, value|
          translated_key = mapper[key] || key
          translated_hash[translated_key.to_sym] = URI.unescape(value)
        end
        translated_hash
      end

      def load_config(file)
        YAML::load_file(File.join(TrafficSourceParser.config_path, file))
      end

    end
  end
end
