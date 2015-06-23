require 'ostruct'

module TrafficSourceParser
  module Parsers
    module ReferrerParser
      module DomainTools

      def domain
        PublicSuffix.parse(clear_domain).domain
      end

      def clear_domain
        ref = @referrer
        ref.gsub!(/.*?:\/\//, '')
        ref.gsub(/\/.*$/, '')
      end

      def referrer_regex
        Regexp.new(domain)
      end

      end
    end

  end
end