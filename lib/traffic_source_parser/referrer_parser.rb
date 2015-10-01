require 'traffic_source_parser/referrer_parser/domain_tools'
require 'traffic_source_parser/referrer_parser/social_parser'
require 'traffic_source_parser/referrer_parser/search_parser'
require 'traffic_source_parser/referrer_parser/generic_parser'
require 'traffic_source_parser/tools'
require 'traffic_source_parser/result/direct'
require 'traffic_source_parser/result/unknown'
require 'yaml'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      extend self
      extend Tools

      # TODO - worst module ever...REFACTOR

      REFERRER_PARSERS = {
        "social" => SocialParser,
        "search" => SearchParser
      }

      def parse(referrer)
        @referrer = referrer
        return  TrafficSourceParser::Result::Direct.new if direct_source?
        return  TrafficSourceParser::Result::Unknown.new if unknown_source?
        referrer_parser.result(@referrer, referrer_source)
      end

      def referrer_parser
        return  GenericParser unless params_for_referrer
        REFERRER_PARSERS[referrer_type]
      end

      def invalid_referrer?
        !DomainTools.valid?(@referrer)
      end

      def referrer_type
        params_for_referrer["type"]
      end

      def referrer_source
        return referrer_domain unless params_for_referrer
        params_for_referrer["source"]
      end

      def referrer_domain
        DomainTools.domain(@referrer.dup)
      end

      def referrer_regex
         Regexp.new(referrer_domain)
      end

      def params_for_referrer
        _, referrer_data = referrers_list.find do |referrer, referrer_hash|
          referrer == DomainTools.clear_domain(@referrer.dup) || referrer == referrer_domain
        end
        referrer_data
      end

      def social_sources
        referrers_list.select {|x,y| y["type"] == "social" }.collect(&:first) #map {|x,y| x }
      end

      def search_sources
        referrers_list.select {|x,y| y["type"] == "search" }.collect(&:first) #map {|x,y| x }
      end

      def referrers_list
        @sources_lists ||= load_config('referrers.yml')
      end

      def unknown_source?
        @referrer.nil? || @referrer.empty? || invalid_referrer?
      end

      def direct_source?
        @referrer == "(none)"
      end

    end

  end

end
