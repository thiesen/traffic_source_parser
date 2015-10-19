require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Result
    class Utmz < TrafficSourceParser::Result::Generic

      def initialize(utmz_hash)
        super(utmz_hash)

        self[:source] = get_known_source(utmz_hash)
      end

    end
  end
end
