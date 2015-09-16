require 'traffic_source_parser/parser/tools'
require 'traffic_source_parser/result/campaign'

module TrafficSourceParser
  module Parser
    module CampaignParser
      extend self
      extend Tools

      def parse(campaign_query)
        @campaign_query = campaign_query
        TrafficSourceParser::Result::Campaign.new(campaign_hash)
      end

      def campaign_hash
        translate_keys(parsed_campaign_params, campaign_params_mapper)
      end

      def campaign_params
        get_params(@campaign_query)
      end

      def parsed_campaign_params
        parse_params(campaign_params)
      end

      def campaign_params_mapper
        @campaign_params ||= load_config('campaign_params.yml')
      end

    end
  end
end
