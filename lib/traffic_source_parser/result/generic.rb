require 'ostruct'

module TrafficSourceParser
  module Result

    class Generic < OpenStruct

      def initialize(ref)
        super(source: ref)
      end

    end
  end
end
