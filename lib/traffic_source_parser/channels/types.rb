# Dir['./lib/traffic_source_parser/channels/types/*.rb'].each {|f| require f}
require 'traffic_source_parser/channels/types/direct'
require 'traffic_source_parser/channels/types/display'
require 'traffic_source_parser/channels/types/email'
require 'traffic_source_parser/channels/types/organic'
require 'traffic_source_parser/channels/types/other'
require 'traffic_source_parser/channels/types/other_advertising'
require 'traffic_source_parser/channels/types/paid'
require 'traffic_source_parser/channels/types/referral'
require 'traffic_source_parser/channels/types/social'
require 'traffic_source_parser/channels/types/unknown'

module TrafficSourceParser
  module Channels
    module Types
    end
  end
end
