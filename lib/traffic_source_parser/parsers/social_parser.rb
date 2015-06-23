require 'traffic_source_parser/parsers/abstract_parser'

module TrafficSourceParser
  module Parsers
    class SocialParser < AbstractParser

      def initialize(source, referrer)
        @referrer = referrer
        super(ccn: "(social)", csr: source)
      end
    end
  end
end