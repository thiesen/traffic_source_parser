require 'ostruct'

module TrafficSourceParser
  module Result

    class Generic < OpenStruct

      def initialize(ref)
        source = ref.empty? ? "(none)" : ref
        super(source: source)
      end

    end
  end
end
