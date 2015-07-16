require 'ostruct'

module TrafficSourceParser
  module Parser
    module ReferrerParser
      class Search < OpenStruct

        QUERY = {
          "Bing" => /search\?q=(.*?)&/,
        }

        def initialize(source, referrer)
          @source = source
          @referrer = referrer
          super(search_hash)
        end

        def search_hash
          hash = basic_search_hash
          hash.merge!(query: keywords) if keywords
          hash
        end

        def keywords
          if QUERY[@source]
            query = @referrer.scan(QUERY[@source]).flatten.first
            query.gsub('+', ' ') if query
          end
        end

        def basic_search_hash
          { source: @source }
        end

      end
    end
  end
end
