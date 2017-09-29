require 'traffic_source_parser/parser/domain_tools'
require 'traffic_source_parser/parser/social_parser'
require 'traffic_source_parser/parser/search_parser'
require 'traffic_source_parser/parser/generic_parser'
require 'traffic_source_parser/tools'
require 'traffic_source_parser/result/direct'
require 'traffic_source_parser/result/unknown'
require 'yaml'

module TrafficSourceParser
  module Parser
    class ReferrerParser
      extend Tools

      attr_reader :referrer

      REFERRER_PARSERS = {
        'social' => SocialParser,
        'search' => SearchParser
      }.freeze

      def initialize(referrer)
        @referrer = referrer
      end

      def parse
        return  TrafficSourceParser::Result::Direct.new if direct_source?
        return  TrafficSourceParser::Result::Unknown.new if unknown_source?
        type, source = referrer_data
        referrer_parser(type).result(referrer, referrer_source(source))
      end

      private

      def direct_source?
        referrer == '(none)'
      end

      def unknown_source?
        referrer.nil? || referrer.empty? || invalid_referrer?
      end

      def invalid_referrer?
        !DomainTools.valid?(referrer)
      end

      def referrer_data
        @referrer = DomainTools.clear_domain(referrer.dup)
        return unless referrer
        referrers_list.each do |type, refs|
          refs.each { |ref, sources| return type, ref if referrer.match(sources * '|') }
        end
      end

      def referrer_parser(type)
        REFERRER_PARSERS[type] || GenericParser
      end


      def referrer_source(source)
        source || referrer_domain
      end

      def referrer_domain
        DomainTools.domain(referrer.dup)
      end

      def social_sources
        referrers_list['social']
      end

      def search_sources
        referrers_list['search']
      end

      def referrers_list
        @sources_lists ||= load_config('referrers.yml')
      end
    end
  end
end
