require 'ostruct'

module TrafficSourceParser
  module Result

    class Unknown < OpenStruct

      def initialize
        super(
          {
            source: "unknown",
            campaign: "unknown",
            medium: "unknown"
          }
        )
      end

    end
  end
end
