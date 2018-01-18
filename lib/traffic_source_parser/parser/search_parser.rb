require 'traffic_source_parser/result/search'

module TrafficSourceParser
  module Parser
    module SearchParser
      extend self

      QUERY = {
        "Bing" => /search\?q=(.*?)&/,
        "Yahoo" => /search\?p=(.*?)&/,
      }

      def result(referrer, source)
        @referrer = referrer
        @source = source
        TrafficSourceParser::Result::Search.new(search_hash, @referrer)
      end

      def search_hash
        hash = basic_search_hash
        hash.merge!(term: keywords) if keywords

        hash
      end

      def keywords
        if QUERY[@source]
          query = @referrer.scan(QUERY[@source]).flatten.first
          query.gsub('+', ' ') if query
        end
      end

      def basic_search_hash
        { source: @source, medium: "organic" }
      end

    end
  end
end
