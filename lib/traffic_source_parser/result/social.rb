require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result

    class Social < TrafficSourceParser::Result::Generic

      def initialize(social_hash)
        super(social_hash)
      end

    end
  end
end
