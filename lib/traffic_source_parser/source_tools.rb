module TrafficSourceParser
  module SourceTools

    def source_parser
      TrafficSourceParser.sources_list.each do |source_type, sources|
        _, src = sources.find { |key, _| key =~ referrer_regex }
        parser = Parsers.create(source_type)
        return parser.new(src, @referrer)
      end
    end

    def sources_list
      @sources_lists ||= YAML.load_file './config/sources.yml'
    end


  end

end

