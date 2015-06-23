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

      it "returns TrafficSourceParser::Parsers::ReferrerParser::Social object with the correct (fake) utm csr" do
        social_sources.each do |source|
          parsed_result = TrafficSourceParser.parse(source[:referrer])
          expect(parsed_result).to be_a TrafficSourceParser::Parsers::ReferrerParser::Social
          expect(parsed_result.csr).to eq source[:source]
        end
      end

    end

    context "when source is utmz" do

      let(:utmz_sources) do
        [
          {
            utmz: "utmz:256172697.1432831709.1.1.utmcsr=(direct)|utmccn=(dir" +
                  "ect)|utmcmd=(none)",
            utmcsr: "(direct)",
            utmccn: "(direct)",
            utmcmd: "(none)"
          },
          {
            utmz: "utmz:231152653.1432828491.1.1.utmcsr=t.co|utmccn=(referra" +
                  "l)|utmcmd=referral|utmcct=/EFzCFawFrk",
            utmcsr: "t.co",
            utmccn: "(referral)",
            utmcmd: "referral",
            utmcct: "/EFzCFawFrk"
          },
          {
            utmz: "utmz:10083233.1432828099.1.1.utmcsr=facebook.com|utmccn=2" +
                  "0150528-ef-aprovacaoharvard|utmcmd=socialmedia-fe",
            utmcsr: "facebook.com",
            utmccn: "20150528-ef-aprovacaoharvard",
            utmcmd: "socialmedia-fe"
          },
          {
            utmz: "utmz:153788330.1432828657.1.1.utmcsr=(direct)|utmccn=(dir" +
                  "ect)|utmcmd=(none)",
            utmcsr: "(direct)",
            utmccn: "(direct)",
            utmcmd: "(none)"
          },
          {
            utmz: "utmz:210677130.1432831711.1.1.utmcsr=rakuten|utmccn=links" +
                  "hare|utmcmd=(not set)",
            utmcsr: "rakuten",
            utmccn: "linkshare",
            utmcmd: "(not set)"
          },
          {
            utmz: "utmz:10083233.1432828147.6.5.utmcsr=newsletter|utmccn=201" +
                  "50527|utmcmd=newsletter-ef|utmctr=communitycolleges|utmcc" +
                  "t=programa",
            utmcsr: "newsletter",
            utmccn: "20150527",
            utmcmd: "newsletter-ef",
            utmctr: "communitycolleges",
            utmcct: "programa"
          },
          {
            utmz: "utmz:63514687.1432831892.1.1.utmcsr=adwords_gereboletos1m" +
                  "in5_22072014|utmgclid=CNjQrtjy5MUCFQYXHwod7k0A8g|utmccn=(" +
                  "not set)|utmcmd=(not set)",
            utmcsr: "adwords_gereboletos1min5_22072014",
            utmgclid: "CNjQrtjy5MUCFQYXHwod7k0A8g",
            utmccn: "(not set)",
            utmcmd: "(not set)"
          }
        ]
      end

      it "returns TrafficSourceParser::Parsers::UtmzParser with attributes" do
        utmz_sources.each do |source|
          utmz = source.delete(:utmz)
          parsed_result = TrafficSourceParser.parse(utmz)
          expect(parsed_result).to be_a TrafficSourceParser::Parsers::UtmzParser::Utmz
          source.keys.each do |key|
            expect(parsed_result.send(key)).to eq source[key]
          end
        end
      end

    end
  end

end