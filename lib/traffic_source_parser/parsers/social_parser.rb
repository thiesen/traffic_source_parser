require 'ostruct'

module TrafficSourceParser
  module Parsers
    class SocialParser < OpenStruct

      def initialize(source, referrer)
        @referrer = referrer
        super(ccn: "(social)", csr: source)
      end
    end
  end
end