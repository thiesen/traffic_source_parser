require 'traffic_source_parser/parsers/referrer_parser/social'
require 'traffic_source_parser/parsers/referrer_parser/generic'
require 'traffic_source_parser/parsers/referrer_parser/domain_tools'
require 'yaml'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      extend self

      extend DomainTools

      REFERRER_PARSERS = {
        "social" => Social
      }

      def parse(referrer)
        @referrer = referrer
        referrer_parser
      end

      def referrer_parser
        referrers_list.each do |source_type, sources|
          _, src = sources.find { |key, _| key =~ referrer_regex }
          parser = define_referrer_parser(source_type)
          return parser.new(src, @referrer)
        end
      end

      def define_referrer_parser(source_type)
        REFERRER_PARSERS[source_type] || Generic
      end

      def referrers_list
        @sources_lists ||= YAML.load_file './config/sources.yml'
      end

    end

  end

end

