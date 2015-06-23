require 'traffic_source_parser/parsers/abstract_parser'

module TrafficSourceParser
  module Parsers
    class GenericParser < AbstractParser

      def initialize(source, referrer)
        @referrer = referrer
        super(ccn: "(direct)", csr: "none")
      end
    end

  end
end