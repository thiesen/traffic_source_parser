require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result
    class Utmz < TrafficSourceParser::Result::Generic

      def initialize(utmz_hash)
        super(utmz_hash)

        self[:source] = get_known_source(utmz_hash) if use_known_sources?(utmz_hash)
      end

      private

      def use_known_sources?(utmz_hash)
        TrafficSourceParser::Parser::ReferrerParser.referrers_list.has_key?(utmz_hash[:source])
      end

      def get_known_source(utmz_hash)
        TrafficSourceParser::Parser::ReferrerParser.referrers_list[utmz_hash[:source]]['source']
      end

    end
  end
end
