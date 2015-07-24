require 'traffic_source_parser/parser/referrer_parser/domain_tools'
require 'traffic_source_parser/result/generic'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      module GenericParser
        extend self

        def result(referrer, source)
          @referrer = referrer
          @source = source
          TrafficSourceParser::Result::Generic.new(generic_hash)
        end

        def generic_hash
          hash = basic_hash
          hash.merge!(term: url_content) if url_content
          hash
        end

        def url_content
          url = DomainTools.remove_protocol(@referrer)
          DomainTools.url_content(url)
        end

        def basic_hash
          { source: @source, medium: "referral", campaign: "(referral)" }
        end

      end
    end
  end
end
