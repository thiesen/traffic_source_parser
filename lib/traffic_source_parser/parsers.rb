require "traffic_source_parser/parsers/referrer_parser"
require "traffic_source_parser/parsers/utmz_parser"
require "traffic_source_parser/parsers/campaign_parser"

module TrafficSourceParser
  module Parsers
    extend self

    def create(cookie_value)
      @cookie_value = cookie_value
      parser.parse cookie_value
    end

    private

    def parser
      return UtmzParser if is_utmz?
      return CampaignParser if is_campaign?
      ReferrerParser
    end

    def is_utmz?
      @cookie_value.include? "utmz:"
    end

    def is_campaign?
      @cookie_value.include? "campaign:"
    end

  end
end