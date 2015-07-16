require 'ostruct'

module TrafficSourceParser
  module Result

    class Search < OpenStruct

      def initialize(search_hash)
        super(search_hash)
      end

    end
  end
end
