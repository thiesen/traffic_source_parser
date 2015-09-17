require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Organic
        extend self

          def channel_name
            'Organic Search'
          end

          # Traffic from unpaid search on any search engine (i.e., medium="organic").
          def match_source?(traffic_source)
            traffic_source[:medium] == 'organic'
          end

      end
    end
  end
end
