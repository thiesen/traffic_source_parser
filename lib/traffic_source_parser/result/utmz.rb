require 'ostruct'

module TrafficSourceParser
  module Result
    class Utmz < OpenStruct

      def initialize(utmz_hash)
        super(utmz_hash)
      end

    end
  end
end
