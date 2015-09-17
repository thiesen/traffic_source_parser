require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Referral
        extend self

          def channel_name
            'Referral'
          end

          # Traffic from websites that are not social networks.
          def match_source?(traffic_source)
            traffic_source[:medium] == 'referral'
          end

      end
    end
  end
end
