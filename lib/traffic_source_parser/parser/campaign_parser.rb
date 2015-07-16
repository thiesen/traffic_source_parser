require 'traffic_source_parser/parser/campaign_parser/campaign'

module TrafficSourceParser
  module Parser
    module CampaignParser
      extend self

      def parse(campaign_query)
        @campaign_query = campaign_query
        return Campaign.new(campaign_hash)
      end

      def campaign_hash
        parse_campaign_params.to_h
      end

      def campaign_params
        @campaign_query.scan(/(\w+=[^&]*)/).flatten
      end

      def parse_campaign_params
        campaign_params.map {|param| param.split('=') }
      end

    end
  end
end

