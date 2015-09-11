# https://support.google.com/analytics/answer/1191184?hl=en
# https://support.google.com/analytics/answer/3297892?hl=en

module TrafficSourceParser
  module Parser
    module Channels
      extend self

      # TODO - refactor (go horse to make it work)

      module MediumRegex
        DISPLAY = /^(display|cpm|banner)$/
        OTHER_ADVERTISING = /^(cpv|cpa|cpp|content-text)$/
        PAID_SEARCH = /^(cpc|ppc|paidsearch)$/
        SOCIAL = /^(social|social-network|social-media|sm|social network|social media)$/
        EMAIL = /mail/i
      end

      module Types
        EMAIL                = "Email"
        REFERRAL             = "Referral"
        DISPLAY              = "Display"
        SOCIAL               = "Social"
        OTHER_ADVERTISING    = "Other Advertising"
        ORGANIC              = "Organic Search"
        PAID                 = "Paid Search"
        DIRECT               = "Direct"
        OTHER                = "Other"
        UNKNOWN              = "Unknown"
      end

      def define_channel(traffic_source)
        return Types::OTHER_ADVERTISING if other_advertising?(traffic_source)
        return Types::REFERRAL if referral?(traffic_source)
        return Types::DISPLAY if display?(traffic_source)
        return Types::DIRECT if direct?(traffic_source)
        return Types::ORGANIC if organic?(traffic_source)
        return Types::PAID if paid?(traffic_source)
        return Types::EMAIL if email?(traffic_source)
        return Types::SOCIAL if social?(traffic_source)
        return Types::UNKNOWN if unknown?(traffic_source)
        Types::OTHER
      end

      # Sessions in which the user typed the name of your website URL into the browser or came to your site via a bookmark (i.e., source="(direct)" and medium="(not set)" or "(none)").
      def direct?(traffic_source)
        (traffic_source.medium == "(not set)" && traffic_source.source == "(direct)") || traffic_source.medium == "(none)"
      end

      # Traffic from websites that are not social networks.
      def referral?(traffic_source)
        traffic_source.medium == 'referral'
      end

      # Interactions with a medium of "display" or "cpm". Also includes AdWords interactions with ad distribution network set to "content".
      def display?(traffic_source)
        traffic_source.medium =~ MediumRegex::DISPLAY
      end

      # Sessions that are tagged with a medium of "cpc", "ppc", "cpm", "cpv", "cpa", "cpp", "content-text", "affiliate" (excluding Paid Search).
      def other_advertising?(traffic_source)
        traffic_source.medium =~ MediumRegex::OTHER_ADVERTISING
      end

      def unknown?(traffic_source)
        traffic_source.medium == 'unknown'
      end

      # Sessions that are tagged with a medium of "email".
      def email?(traffic_source)
        traffic_source.medium =~ MediumRegex::EMAIL
      end


      # Traffic from any of approximately 400 social networks (that are not tagged as ads).
      def social?(traffic_source)
        traffic_source.medium =~ MediumRegex::SOCIAL ||  TrafficSourceParser::Parser::ReferrerParser.social_sources.grep(Regexp.new(traffic_source.source, /i/)).any?
      end

      # Traffic from unpaid search on any search engine (i.e., medium="organic").
      def organic?(traffic_source)
        traffic_source.medium == 'organic'
      end


      # Traffic from the AdWords Search Network or other search engines, with a medium of "cpc" or "ppc" .
      def paid?(traffic_source)
        traffic_source.medium =~ MediumRegex::PAID_SEARCH
      end

    end

  end

end