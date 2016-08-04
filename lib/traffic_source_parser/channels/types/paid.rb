require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Paid
        extend self

          PAID_SEARCH_REGEX = /^(cpc|ppc|paidsearch)$/

          def channel_name
            'Paid Search'
          end

          def match_source?(traffic_source)
            traffic_source[:medium] =~ PAID_SEARCH_REGEX || utmgclid?(traffic_source)
          end

          def utmgclid?(traffic_source)
            !traffic_source[:utmgclid].nil?
          end

      end
    end
  end
end
