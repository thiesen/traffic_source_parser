require 'traffic_source_parser/parser/domain_tools'
require 'traffic_source_parser/parser/social_parser'
require 'traffic_source_parser/parser/search_parser'
require 'traffic_source_parser/parser/generic_parser'
require 'traffic_source_parser/tools'
require 'traffic_source_parser/known_sources'
require 'traffic_source_parser/result/direct'
require 'traffic_source_parser/result/unknown'

module TrafficSourceParser
  class ReferrerParser

    REFERRER_PARSERS = {
      'social' => Parser::SocialParser,
      'search' => Parser::SearchParser
    }.freeze
    private_constant :REFERRER_PARSERS

    def initialize(referrer)
      @referrer = referrer
    end

    def parse
      return  Result::Direct.new if direct_source?
      return  Result::Unknown.new if unknown_source?
      type, source = referrer_data
      referrer_parser(type).result(referrer, referrer_source(source))
    end

    private

    attr_reader :referrer

    def direct_source?
      referrer == '(none)'
    end

    def unknown_source?
      referrer.nil? || referrer.empty? || invalid_referrer?
    end

    def invalid_referrer?
      !Parser::DomainTools.valid?(referrer)
    end

    def referrer_data
      domain = Parser::DomainTools.clear_domain(referrer)
      return unless domain
      KnownSources.list.each do |type, refs|
        refs.each { |ref, sources| return type, ref if domain.match(sources * '|') }
      end
    end

    def referrer_parser(type)
      REFERRER_PARSERS[type] || Parser::GenericParser
    end

    def referrer_source(source)
      source || referrer_domain
    end

    def referrer_domain
      Parser::DomainTools.domain(referrer)
    end
  end
end
