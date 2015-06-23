require 'ostruct'

module TrafficSourceParser
  module Parsers
    module UtmzParser
      module UtmzTools
        extend self

        def utmz_hash
          parse_utmz_params.to_h
        end

        def utmz_params
          @utmz.scan(/(\w+=[^|]*)/).flatten
        end

        def parse_utmz_params
          utmz_params.map {|param| param.split('=') }
        end
      end
    end
  end
end