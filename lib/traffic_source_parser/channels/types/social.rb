require 'traffic_source_parser/channels/types/base_type'

module TrafficSourceParser
  module Channels
    module Types
      module Social
        extend self

          SOCIAL_REGEX = /^(social|social-network|social-media|sm|social network|social media)$/

          def channel_name
            'Social'
          end

          # Traffic from any of approximately 400 social networks (that are not tagged as ads).
          def match_source?(traffic_source)
            traffic_source[:medium] =~ SOCIAL_REGEX || known_social?(traffic_source[:source])
          end

          def known_social?(source)
            return false unless source
            TrafficSourceParser::Parser::ReferrerParser.social_sources.include?(source.downcase)
          end

      end
    end
  end
end
