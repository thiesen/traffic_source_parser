require "traffic_source_parser/version"
require "traffic_source_parser/parser"

module TrafficSourceParser
  extend self

  def parse(cookie_value)
    Parser.create cookie_value
  end

end
