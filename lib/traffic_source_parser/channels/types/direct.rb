require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Direct
        extend self

          def channel_name
            'Direct'
          end

          # Sessions in which the user typed the name of your website URL into the browser or came to your site via a bookmark (i.e., source="(direct)" and medium="(not set)" or "(none)").
          def match_source?(traffic_source)
            (traffic_source[:medium] == '(not set)' && traffic_source[:source] == '(direct)') || traffic_source[:medium] == '(none)'
          end

      end
    end
  end
end
