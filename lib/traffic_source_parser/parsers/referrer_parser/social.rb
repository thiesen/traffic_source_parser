require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      class Social < OpenStruct

        def initialize(source, referrer = nil)
          super(source: source)
        end

      end
    end
  end
end