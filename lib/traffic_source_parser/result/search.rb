require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result

    class Search < TrafficSourceParser::Result::Generic

      def initialize(search_hash)
        super(search_hash)
      end

    end
  end
end
