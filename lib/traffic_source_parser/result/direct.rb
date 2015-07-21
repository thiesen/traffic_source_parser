require 'ostruct'

module TrafficSourceParser
  module Result

    class Direct < OpenStruct

      def initialize
        super(
          {
            source: "(direct)",
            campaign: "(direct)",
            medium: "(none)"
          }
        )
      end

    end
  end
end
