require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      class Generic < OpenStruct

        def initialize(referrer)
          super(source: referrer)
        end

      end
    end

  end
end