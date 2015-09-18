# https://support.google.com/analytics/answer/1191184?hl=en
# https://support.google.com/analytics/answer/3297892?hl=en
require 'traffic_source_parser/channels/types'


module TrafficSourceParser
  module Channels
    extend self

    AVAILABLE_TYPES = [
      Types::OtherAdvertising,
      Types::Social,
      Types::Referral,
      Types::Display,
      Types::Direct,
      Types::Organic,
      Types::Paid,
      Types::Email,
      Types::Unknown
    ]

    def define_channel(traffic_source)

      AVAILABLE_TYPES.each do |type|
        return type.channel_name if type.match_source?(traffic_source)
      end

      return Types::Other.channel_name
    end

  end

end
