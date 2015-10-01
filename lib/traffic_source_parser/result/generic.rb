require 'ostruct'
require 'traffic_source_parser/channels'

module TrafficSourceParser
  module Result

    class Generic < OpenStruct

      def initialize(source_hash)
        super(
          source_hash.merge!({ channel: TrafficSourceParser::Channels.define_channel(source_hash) })
        )
      end

      private

      def use_known_sources?(source_hash)
        TrafficSourceParser::Parser::ReferrerParser.referrers_list.has_key?(source_hash[:source])
      end

      def get_known_source(source_hash)
        TrafficSourceParser::Parser::ReferrerParser.referrers_list[source_hash[:source]]['source']
      end

    end
  end
end
