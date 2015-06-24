require "traffic_source_parser/version"
require "traffic_source_parser/parsers"

module TrafficSourceParser
  extend self

  def parse(cookie_value)
    Parsers.create cookie_value
  end

end
