require 'ostruct'

module TrafficSourceParser
  module Parsers
    module UtmzParser
      class Utmz < OpenStruct

        def initialize(utmz_hash)
          super(utmz_hash)
        end

      end
    end
  end
end