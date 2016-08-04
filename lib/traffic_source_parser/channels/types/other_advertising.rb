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

          def match_source?(traffic_source)
            traffic_source[:medium] =~ OTHER_ADVERTISING_REGEX
          end

      end
    end
  end
end
