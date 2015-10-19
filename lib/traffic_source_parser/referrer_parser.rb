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
        type, source = referrer_data
        referrer_parser(type).result(@referrer, referrer_source(source))
      end

      def referrer_parser(type)
        REFERRER_PARSERS[type] || GenericParser
      end

      def invalid_referrer?
        !DomainTools.valid?(@referrer)
      end

      def referrer_data
        referrer = DomainTools.clear_domain(@referrer.dup)
        referrers_list.each{|type, refs| refs.each{|ref, sources| return type, ref if referrer.match(sources * '|')} }
      end

      def referrer_source(source)
        source || referrer_domain
      end

      def referrer_domain
        DomainTools.domain(@referrer.dup)
      end

      def social_sources
        referrers_list["social"] #map {|x,y| x }
      end

      def search_sources
        referrers_list["search"] #map {|x,y| x }
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
