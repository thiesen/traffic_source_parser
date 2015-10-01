require 'traffic_source_parser/result/generic'
require 'traffic_source_parser/channels/types/paid'

module TrafficSourceParser
  module Result

    class Search < TrafficSourceParser::Result::Generic

    PAID_TERM = {
      "Yahoo" => /search\?p=/,
      "Google" => /aclk\?/,
    }

      def initialize(search_hash, referrer)
        super(search_hash)

        if is_paid?(search_hash, referrer)
          self[:channel] = TrafficSourceParser::Channels::Types::Paid.channel_name
          self[:medium] = "cpc"
        end
      end

      def is_paid?(search_hash, referrer)
        PAID_TERM[search_hash[:source]] =~ referrer
      end

    end
  end
end
