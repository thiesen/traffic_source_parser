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

      def get_known_source
        return unless source
        referrers_list.values.each{|h| h.each{|k, v| return k if source.match(v * '|') }}
        source
      end

      def referrers_list
        TrafficSourceParser::KnownSources.list
      end

    end
  end
end
