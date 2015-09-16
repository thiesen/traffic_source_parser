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

    end
  end
end
