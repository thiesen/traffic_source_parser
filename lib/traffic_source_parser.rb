require "traffic_source_parser/version"
require "traffic_source_parser/parser"

module TrafficSourceParser
  extend self

  def self.config_path
    File.join File.dirname(__dir__), "config"
  end

  def parse(cookie_value)
    Parser.create cookie_value unless cookie_value.empty?
  end

end
