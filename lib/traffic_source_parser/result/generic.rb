require 'ostruct'

module TrafficSourceParser
  module Result

    class Generic < OpenStruct

      def initialize(source_hash)
        super(source_hash)
      end

    end
  end
end
