require 'traffic_source_parser/parsers/campaign_parser/campaign'
require 'uri'

module TrafficSourceParser
  module Parsers
    module CampaignParser
      extend self

      def parse(campaign_url)
        @campaign_url = campaign_url
        return Campaign.new(campaign_hash)
      end

      def campaign_hash
        parse_campaign_params.to_h
      end

      def campaign_params
        parse_campaign_url.scan(/(\w+=[^&]*)/).flatten
      end

      def parse_campaign_params
        campaign_params.map {|param| param.split('=') }
      end

      def parse_campaign_url
        URI(@campaign_url).query
      end

    end
  end
end

