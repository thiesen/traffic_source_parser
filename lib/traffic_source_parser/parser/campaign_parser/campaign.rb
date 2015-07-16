require 'ostruct'

module TrafficSourceParser
  module Parser
    module CampaignParser
      class Campaign < OpenStruct

        def initialize(campaign_hash)
          super(campaign_hash)
        end

      end
    end
  end
end