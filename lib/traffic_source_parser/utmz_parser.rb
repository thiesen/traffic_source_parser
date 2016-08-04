require 'traffic_source_parser/tools'
require 'traffic_source_parser/result/utmz'

module TrafficSourceParser
  module Parser
    module UtmzParser
      extend self
      extend Tools

      def match_cookie_value?(value)
        value =~ /utmccn|utmcmd|utmcsr|utmctr|utmcct/
      end

      def parse(utmz)
        @utmz = utmz
        TrafficSourceParser::Result::Utmz.new(utmz_hash)
      end

      def utmz_params
        get_params(@utmz)
      end

      def parsed_utmz_params
        parse_params(utmz_params)
      end

      def utmz_hash
        translated_utmz_hash = translate_keys(parsed_utmz_params, utmz_params_mapper)

        if translated_utmz_hash.delete(:utmgclid)
          translated_utmz_hash[:medium] = "cpc"
        end

        translated_utmz_hash
      end

      def utmz_params_mapper
        @campaign_params ||= load_config('utmz_params.yml')
      end

    end
  end
end
