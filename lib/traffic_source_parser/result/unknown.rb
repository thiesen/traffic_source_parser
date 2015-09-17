require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result

    class Unknown < TrafficSourceParser::Result::Generic

      def initialize
        super(
          {
            source: "unknown",
            campaign: "unknown",
            medium: "unknown"
          }
        )
      end

    end
  end
end
