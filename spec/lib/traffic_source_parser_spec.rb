require 'spec_helper'

describe TrafficSourceParser do

  shared_examples_for "returns the correct object with attributes" do
    it "returns klass object with hash attributes" do
       sources.each do |source|
          cookie_value = source.delete(:cookie_value)
          parsed_result = TrafficSourceParser.parse(cookie_value)
          expect(parsed_result).to be_a klass
          source.keys.each do |key|
            expect(parsed_result.send(key)).to eq source[key]
          end
        end
    end
  end

  it 'has a version number' do
    expect(TrafficSourceParser::VERSION).not_to be nil
  end

  describe ".parse" do

    context "when source is a recognized social network" do

      let(:sources) do
        [
          { cookie_value: "https://www.facebook.com/", source: "Facebook" },
          { cookie_value:  "http://t.co/W1pX6dNa2V", source: "Twitter" },
          { cookie_value: "https://www.linkedin.com/", source: "LinkedIn" },
          { cookie_value: "http://plus.url.google.com/url", source: "Google Plus" },
          { cookie_value: "https://www.pinterest.com/", source: "Pinterest" }
        ]
      end

      let(:klass) { TrafficSourceParser::Parsers::ReferrerParser::Social }

      it_behaves_like "returns the correct object with attributes"

    end

    context "when source is utmz" do

      let(:sources) do
        [
          {
            cookie_value: "utmz:256172697.1432831709.1.1.utmcsr=(direct)|utm" +
                          "ccn=(direct)|utmcmd=(none)",
            utmcsr: "(direct)",
            utmccn: "(direct)",
            utmcmd: "(none)"
          },
          {
            cookie_value: "utmz:231152653.1432828491.1.1.utmcsr=t.co|utmccn" +
                          "=(referral)|utmcmd=referral|utmcct=/EFzCFawFrk",
            utmcsr: "t.co",
            utmccn: "(referral)",
            utmcmd: "referral",
            utmcct: "/EFzCFawFrk"
          },
          {
            cookie_value: "utmz:10083233.1432828099.1.1.utmcsr=facebook.com|" +
                          "utmccn=20150528-ef-aprovacaoharvard|utmcmd=social" +
                          "media-fe",
            utmcsr: "facebook.com",
            utmccn: "20150528-ef-aprovacaoharvard",
            utmcmd: "socialmedia-fe"
          },
          {
            cookie_value: "utmz:153788330.1432828657.1.1.utmcsr=(direct)|utm" +
                          "ccn=(direct)|utmcmd=(none)",
            utmcsr: "(direct)",
            utmccn: "(direct)",
            utmcmd: "(none)"
          },
          {
            cookie_value: "utmz:210677130.1432831711.1.1.utmcsr=rakuten|utmc" +
                          "cn=linkshare|utmcmd=(not set)",
            utmcsr: "rakuten",
            utmccn: "linkshare",
            utmcmd: "(not set)"
          },
          {
            cookie_value: "utmz:10083233.1432828147.6.5.utmcsr=newsletter|ut" +
                          "mccn=20150527|utmcmd=newsletter-ef|utmctr=communi" +
                          "tycolleges|utmcct=programa",
            utmcsr: "newsletter",
            utmccn: "20150527",
            utmcmd: "newsletter-ef",
            utmctr: "communitycolleges",
            utmcct: "programa"
          },
          {
            cookie_value: "utmz:63514687.1432831892.1.1.utmcsr=adwords_gereb" +
                          "oletos1min5_22072014|utmgclid=CNjQrtjy5MUCFQYXHwo" +
                          "d7k0A8g|utmccn=(not set)|utmcmd=(not set)",
            utmcsr: "adwords_gereboletos1min5_22072014",
            utmgclid: "CNjQrtjy5MUCFQYXHwod7k0A8g",
            utmccn: "(not set)",
            utmcmd: "(not set)"
          }
        ]
      end

      let(:klass) { TrafficSourceParser::Parsers::UtmzParser::Utmz }

      it_behaves_like "returns the correct object with attributes"

    end

    context "when source is campaign" do

      let(:sources) do
        [
          {
            cookie_value: "http://www.example.com/?utm_campaign=spring&utm_m" +
                          "edium=referral&utm_source=exampleblog",
            utm_campaign: "spring" ,
            utm_medium: "referral" ,
            utm_source: "exampleblog"
          },
          {
            cookie_value: "http://www.example.com/?utm_campaign=spring&utm_m" +
                          "edium=email&utm_source=newsletter1",
            utm_campaign: "spring",
            utm_medium: "email",
            utm_source: "newsletter1"
          },
          {
            cookie_value: "http://www.example.com/?utm_campaign=spring&utm_m" +
                          "edium=email&utm_source=newsletter1&utm_content=to" +
                          "plink",
            utm_campaign: "spring",
            utm_medium: "email",
            utm_source: "newsletter1",
            utm_content: "toplink"
          },
          {
            cookie_value: "http://shipit.resultadosdigitais.com.br/?utm_sour" +
                          "ce=Self+Test+List&utm_campaign=c2994af7da-xunda_m" +
                          "other_campaign&utm_medium=email&utm_term=0_f85d50" +
                          "388c-c2994af7da-69634449",
            utm_source: "Self+Test+List",
            utm_campaign: "c2994af7da-xunda_mother_campaign",
            utm_medium: "email",
            utm_term: "0_f85d50388c-c2994af7da-69634449"

          }
        ]
      end

      let(:klass) { TrafficSourceParser::Parsers::CampaignParser::Campaign }

      it_behaves_like "returns the correct object with attributes"

    end
  end
end
