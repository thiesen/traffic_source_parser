require 'ostruct'

module TrafficSourceParser
  module Result
    class Campaign < OpenStruct

      def initialize(campaign_hash)
        super(campaign_hash)
      end

    end
  end
end
