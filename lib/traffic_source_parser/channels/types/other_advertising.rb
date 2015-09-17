require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module OtherAdvertising
        extend self
        
          OTHER_ADVERTISING_REGEX = /^(cpv|cpa|cpp|content-text)$/

          def channel_name
            'Other Advertising'
          end

          # Sessions that are tagged with a medium of "cpc", "ppc", "cpm", "cpv", "cpa", "cpp", "content-text", "affiliate" (excluding Paid Search).
          def match_source?(traffic_source)
            traffic_source[:medium] =~ OTHER_ADVERTISING_REGEX
          end

      end
    end
  end
end
