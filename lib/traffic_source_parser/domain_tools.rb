module TrafficSourceParser
  module DomainTools

    private

    def domain
      PublicSuffix.parse(clear_domain).domain
    end

    def clear_domain
      ref = @referrer
      ref.gsub!(/.*?:\/\//, '')
      ref.gsub(/\/.*$/, '')
    end

    def referrer_regex
      Regexp.new(domain)
    end

  end

end

