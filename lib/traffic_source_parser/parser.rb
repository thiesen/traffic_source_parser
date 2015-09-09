require "traffic_source_parser/parser/referrer_parser"
require "traffic_source_parser/parser/campaign_parser"
require "traffic_source_parser/parser/utmz_parser"

module TrafficSourceParser
  module Parser
    extend self

    def create(cookie_value)
      @cookie_value = cookie_value
      parser.parse cookie_value
    end

    private

    def parser
      return CampaignParser if is_campaign?
      return UtmzParser if is_utmz?
      ReferrerParser
    end

    def is_campaign?
      @cookie_value =~ /utm_source|utm_medium|utm_term|utm_content|utm_campaign/
    end

    def is_utmz?
      @cookie_value =~ /utmccn|utmcmd|utmcsr|utmctr|utmcct/
    end

  end
end
