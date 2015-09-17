require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Unknown
        extend self

          def channel_name
            'Unknown'
          end

          def match_source?(traffic_source)
            traffic_source[:medium] == 'unknown'
          end

      end
    end
  end
end
