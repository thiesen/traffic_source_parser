require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      class Generic < OpenStruct

        def initialize(source, referrer)
          @referrer = referrer
          super(ccn: "(direct)", csr: "none")
        end

      end
    end

  end
end