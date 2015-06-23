require "traffic_source_parser/version"
require "traffic_source_parser/parsers"
require "traffic_source_parser/source_tools"
require "traffic_source_parser/domain_tools"
require 'public_suffix'
require 'yaml'

module TrafficSourceParser
  extend self

  extend DomainTools
  extend SourceTools

  def parse(referrer)
    @referrer = referrer
    source_parser
  end

end
