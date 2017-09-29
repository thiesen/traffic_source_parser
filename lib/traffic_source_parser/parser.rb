require "traffic_source_parser/referrer_parser"
require "traffic_source_parser/campaign_parser"
require "traffic_source_parser/utmz_parser"

module TrafficSourceParser
  module Parser
    extend self

    AVAILABLE_PARSERS = [ CampaignParser, UtmzParser ]

    def create(cookie_value)
      AVAILABLE_PARSERS.each do |parser|
        return parser.parse(cookie_value) if parser.match_cookie_value?(cookie_value)
      end

      ReferrerParser.new(cookie_value).parse
    end
  end
end
