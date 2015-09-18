require "traffic_source_parser/referrer_parser"
require "traffic_source_parser/campaign_parser"
require "traffic_source_parser/utmz_parser"

module TrafficSourceParser
  module Parser
    extend self

    AVAILABLE_PARSERS = [ CampaignParser, UtmzParser ]

    def create(cookie_value)
      @cookie_value = cookie_value
      parser.parse cookie_value
    end

    private

    def parser

      AVAILABLE_PARSERS.each do |parser|
        return parser if parser.match_cookie_value?(@cookie_value)
      end

      return ReferrerParser
    end

  end
end
