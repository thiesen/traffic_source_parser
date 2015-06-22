require 'ostruct'

module TrafficSourceParser
  class Social < OpenStruct

    def initialize(network, href)
      super(ccn: "(social)", csr: network, href: href)
    end
  end

end
