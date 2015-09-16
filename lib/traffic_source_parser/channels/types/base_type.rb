module TrafficSourceParser
  module Channels
    module Types
      module BaseType
        extend self

          def channel_name
            raise 'this method must be implemented'
          end

          def match_source?(traffic_source)
            raise 'this method must be implemented'
          end

      end
    end
  end
end
