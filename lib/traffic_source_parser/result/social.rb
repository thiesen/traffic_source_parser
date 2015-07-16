require 'ostruct'

module TrafficSourceParser
  module Result

    class Social < OpenStruct

      def initialize(social_hash)
        super(social_hash)
      end

    end
  end
end
