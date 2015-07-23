require 'traffic_source_parser/result/generic'
require 'traffic_source_parser/result/direct'
require 'traffic_source_parser/parser/referrer_parser/domain_tools'
require 'traffic_source_parser/parser/referrer_parser/social_parser'
require 'traffic_source_parser/parser/referrer_parser/search_parser'
require 'yaml'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      extend self

      # TODO - worst module ever...REFACTOR

      REFERRER_PARSERS = {
        "social" => SocialParser,
        "search" => SearchParser
      }

      def parse(referrer)
        @referrer = referrer
        create_referrer_parser
      end

      def create_referrer_parser
        return  TrafficSourceParser::Result::Direct.new if direct_source?
        return recognized_parser if params_for_referrer
        TrafficSourceParser::Result::Generic.new(@referrer)
      end

      def recognized_parser
        parser = define_referrer_parser(@referrer_data["type"])
        source = @referrer_data["source"]
        parser.result(@referrer, source)
      end

      def params_for_referrer
        _, @referrer_data = referrers_list.find do |referrer, referrer_hash|
          referrer =~ DomainTools.referrer_regex(@referrer)
        end
      end

      def define_referrer_parser(source_type)
        REFERRER_PARSERS[source_type]
      end

      def referrers_list
        @sources_lists ||= YAML::load_file(File.join(TrafficSourceParser.config_path, 'referrers.yml'))
      end

      def direct_source?
        @referrer.empty? || !DomainTools.valid?(@referrer)
      end

    end

  end

end

