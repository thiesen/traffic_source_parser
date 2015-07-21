require 'traffic_source_parser/result/campaign'
require 'uri'

module TrafficSourceParser
  module Parser
    module CampaignParser
      extend self

      # TODO - refactor

      def parse(campaign_query)
        @campaign_query = campaign_query
        TrafficSourceParser::Result::Campaign.new(campaign_hash)
      end

      def campaign_hash
        translated_campaign_hash = {}
        parse_campaign_params.to_h.each do |key, value|
          translated_key = campaign_params_mapper[key] || key
          translated_campaign_hash[translated_key] = URI.unescape(value)
        end
        if translated_campaign_hash.delete("utmgclid")
          translated_campaign_hash["medium"] = "cpc"
        end
        translated_campaign_hash
      end

      def campaign_params
        @campaign_query.scan(/(\w+=[^&|\|]*)/).flatten
      end

      def parse_campaign_params
        campaign_params.map {|param| param.split('=') }
      end

      def campaign_params_mapper
        @campaign_params ||= YAML::load_file(File.join(TrafficSourceParser.config_path, 'campaign_params.yml'))
      end

    end
  end
end

