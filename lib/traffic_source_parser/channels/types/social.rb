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

          # Traffic from any of approximately 400 social networks (that are not tagged as other channel).
          def match_source?(traffic_source)
            traffic_source[:medium] =~ SOCIAL_REGEX || get_known_social(traffic_source[:source])
          end

          def get_known_social(source)
            return unless source
            known_social_sources.each{ |k, v| return k if source.downcase.match(v * '|') }
            nil
          end

          def known_social_sources
            TrafficSourceParser::KnownSources.social
          end

      end
    end
  end
end
