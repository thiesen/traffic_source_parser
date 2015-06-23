require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      class Social < OpenStruct

        def initialize(src, referrer)
          super(csr: src, xunda: referrer)
        end

      end
    end
  end
end