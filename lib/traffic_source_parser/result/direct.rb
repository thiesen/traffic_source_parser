require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result

    class Direct < TrafficSourceParser::Result::Generic

      def initialize
        super(
          {
            source: "(direct)",
            campaign: "(direct)",
            medium: "(none)"
          }
        )
      end

    end
  end
end
