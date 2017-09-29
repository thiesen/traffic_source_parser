require 'public_suffix'
require 'uri'

module TrafficSourceParser
  module Parser
    module DomainTools
      extend self

      URL_CONTENT_REGEX = /\/.*$/
      URL_PROTOCOL_DOMAIN = /.*?:\/\//

      def valid?(url)
        PublicSuffix.valid?(clear_domain(url))
      end

      def url_content(url)
        url.scan(URL_CONTENT_REGEX).first
      end

      def domain(url)
        PublicSuffix.parse(clear_domain(url)).domain
      end

      def remove_protocol(url)
        url.gsub(URL_PROTOCOL_DOMAIN, '')
      end

      def remove_url_content(url)
        url.gsub(URL_CONTENT_REGEX, '')
      end

      def clear_domain(url)
        clean_url = remove_protocol(url)
        remove_url_content(clean_url)
      end
    end
  end
end
