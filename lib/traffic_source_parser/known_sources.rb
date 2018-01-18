module TrafficSourceParser
  module KnownSources
    extend Tools

    def self.social
      list['social']
    end

    def self.list
      @list ||= load_config('referrers.yml')
    end
  end
end