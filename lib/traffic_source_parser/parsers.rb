require 'traffic_source_parser/parsers/social_parser'
require 'traffic_source_parser/parsers/generic_parser'

module TrafficSourceParser
  module Parsers
    extend self

    PARSERS = {
      "social" => SocialParser
    }

    def create(source_type)
      PARSERS[source_type] || GenericParser
    end

  end
end