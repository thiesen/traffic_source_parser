require "traffic_source_parser/version"
require "traffic_source_parser/social"
require "traffic_source_parser/domain_tools"
require 'public_suffix'
require 'yaml'

module TrafficSourceParser
  extend self

  extend DomainTools

  def parse(referrer)
    @referrer = referrer
    source_parser
  end

  def source_parser
    TrafficSourceParser.sources_list.each do |source_type, sources|
      _, src = sources.find { |key, _| key =~ referrer_regex }
      parser = self.const_get source_type.capitalize
      return parser.new(src, @referrer)
    end
  end

  def sources_list
    @sources_lists ||= YAML.load_file './config/sources.yml'
  end

end
