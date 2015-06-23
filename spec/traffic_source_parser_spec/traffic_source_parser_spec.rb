require 'spec_helper'

describe TrafficSourceParser do

  it 'has a version number' do
    expect(TrafficSourceParser::VERSION).not_to be nil
  end

  describe ".parse" do

    context "when source is a recognized social network" do

      let(:social_sources) do
        [
          { referrer: "https://www.facebook.com/", source: "Facebook" },
          { referrer:  "http://t.co/W1pX6dNa2V", source: "Twitter" },
          { referrer: "https://www.linkedin.com/", source: "LinkedIn" },
          { referrer: "http://plus.url.google.com/url", source: "Google Plus" },
          { referrer: "https://www.pinterest.com/", source: "Pinterest" }
        ]
      end

      it "returns a TrafficSourceParser::Parsers::SocialParser object with the correct (fake) utm csr" do
        social_sources.each do |source|
          parsed_result = TrafficSourceParser.parse(source[:referrer])
          expect(parsed_result).to be_a TrafficSourceParser::Parsers::SocialParser
          expect(parsed_result.csr).to eq source[:source]
        end
      end

    end
  end

end
