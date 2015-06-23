require 'ostruct'

module TrafficSourceParser
  module Parsers
    class GenericParser < OpenStruct

      def initialize(source, referrer)
        @referrer = referrer
        super(ccn: "(direct)", csr: "none")
      end
    end

  end
end