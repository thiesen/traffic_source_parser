require 'public_suffix'
require 'uri'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      module DomainTools
        extend self

        def referrer_regex(url)
          @url = url.dup
          Regexp.new(domain)
        end

        def valid?(domain)
          domain =~ URI::regexp
        end

        private

        def domain
          PublicSuffix.parse(clear_domain).domain
        end

        def clear_domain
          @url.gsub!(/.*?:\/\//, '')
          @url.gsub(/\/.*$/, '')
        end

      end
    end

  end
end
