require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result
    class Campaign < TrafficSourceParser::Result::Generic

      def initialize(campaign_hash)
        super(campaign_hash)

        self[:source] = get_known_source(campaign_hash) if use_known_sources?(campaign_hash)
      end

    end
  end
end
