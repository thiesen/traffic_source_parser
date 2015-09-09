require 'traffic_source_parser/parser/tools'
require 'traffic_source_parser/result/utmz'

module TrafficSourceParser
  module Parser
    module UtmzParser
      extend self
      extend Tools

      def parse(utmz)
        @utmz = utmz
        TrafficSourceParser::Result::Utmz.new(utmz_hash)
      end

      def utmz_params
        get_params(@utmz)
      end

      def parsed_utmz_params
        parse_params(utmz_params).to_h
      end

      def utmz_hash
        translate_keys(parsed_utmz_params, utmz_params_mapper)
      end

      def utmz_params_mapper
        @campaign_params ||= load_config('utmz_params.yml')
      end


    end
  end
end
