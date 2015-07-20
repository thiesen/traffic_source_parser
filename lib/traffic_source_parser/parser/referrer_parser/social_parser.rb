require 'traffic_source_parser/result/social'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      module SocialParser
        extend self

          def result(referrer, source)
            @source = source
            TrafficSourceParser::Result::Social.new(social_hash)
          end

          def social_hash
            {source: @source }
          end

      end
    end

  end
end