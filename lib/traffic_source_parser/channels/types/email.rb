require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Email
        extend self

          EMAIL_REGEX = /mail/i

          def channel_name
            'Email'
          end

          # Sessions that are tagged with a medium of "email".
          def match_source?(traffic_source)
            traffic_source[:medium] =~ EMAIL_REGEX
          end

      end
    end
  end
end
