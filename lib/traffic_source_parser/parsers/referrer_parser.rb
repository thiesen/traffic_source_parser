require 'traffic_source_parser/parsers/referrer_parser/social'
require 'traffic_source_parser/parsers/referrer_parser/search'
require 'traffic_source_parser/parsers/referrer_parser/generic'
require 'traffic_source_parser/parsers/referrer_parser/domain_tools'
require 'yaml'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      extend self

      extend DomainTools

      # TODO - worst module ever...REFACTOR

      REFERRER_PARSERS = {
        "social" => Social,
        "search" => Search
      }

      def parse(referrer)
        @referrer = referrer
        create_referrer_parser
      end

      def create_referrer_parser
        return recognized_parser if params_for_referrer
        Generic.new @referrer
      end

      def recognized_parser
        parser = define_referrer_parser(@referrer_data["type"])
        source = @referrer_data["source"]
        parser.new source, @referrer
      end

      def params_for_referrer
        _, @referrer_data = referrers_list.find do |referrer, referrer_hash|
          referrer =~ referrer_regex
        end
      end

      def define_referrer_parser(source_type)
        REFERRER_PARSERS[source_type]
      end

      def referrers_list
        @sources_lists ||= YAML.load_file './config/referrers.yml'
      end

    end

  end

end

