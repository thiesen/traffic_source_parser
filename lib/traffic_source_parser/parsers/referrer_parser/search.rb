require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      class Search < OpenStruct

        def initialize(source, referrer = nil)
          super(source: source)
        end

      end
    end
  end
end