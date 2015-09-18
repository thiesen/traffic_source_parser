require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Display
        extend self

          DISPLAY_REGEX = /^(display|cpm|banner)$/

          def channel_name
            'Display'
          end

          # Interactions with a medium of "display" or "cpm". Also includes AdWords interactions with ad distribution network set to "content".
          def match_source?(traffic_source)
            traffic_source[:medium] =~ DISPLAY_REGEX
          end

      end
    end
  end
end
