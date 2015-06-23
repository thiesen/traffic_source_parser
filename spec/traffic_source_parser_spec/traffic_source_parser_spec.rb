require 'spec_helper'

describe TrafficSourceParser do

  it 'has a version number' do
    expect(TrafficSourceParser::VERSION).not_to be nil
  end

  context "social media parser" do

    it "returns the correct (fake) utm source" do
      expect(TrafficSourceParser.parse("https://www.facebook.com/").csr).to eq "Facebook"
      expect(TrafficSourceParser.parse("http://t.co/W1pX6dNa2V").csr).to eq "Twitter"
      expect(TrafficSourceParser.parse("https://www.linkedin.com/").csr).to eq "LinkedIn"
      expect(TrafficSourceParser.parse("http://plus.url.google.com/url").csr).to eq "Google Plus"
      expect(TrafficSourceParser.parse("https://www.pinterest.com/").csr).to eq "Pinterest"
    end

  end

end