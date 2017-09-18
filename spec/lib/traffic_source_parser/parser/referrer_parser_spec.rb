require 'spec_helper'

describe TrafficSourceParser::Parser::ReferrerParser do

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

  describe ".parse" do

    context "when cookie value is (none)" do

      let(:sources) do
        [
          {
            cookie_value: "(none)",
            source: "(direct)",
            campaign: "(direct)",
            channel: "Direct",
            medium: "(none)"
          }
        ]
      end

      let(:klass) {  TrafficSourceParser::Result::Direct }

      it_behaves_like "returns the correct object with attributes"

    end

    context "when cookie value is empty" do

      let(:sources) do
        [
          {
            cookie_value: '',
            source: "unknown",
            campaign: "unknown",
            channel: "Unknown",
            medium: "unknown"
          }
        ]
      end

      let(:klass) {  TrafficSourceParser::Result::Unknown }

      it_behaves_like "returns the correct object with attributes"

    end

    context "when cookie value is nil" do

      let(:sources) do
        [
          {
            cookie_value: nil,
            source: "unknown",
            campaign: "unknown",
            channel: "Unknown",
            medium: "unknown"
          }
        ]
      end

      let(:klass) {  TrafficSourceParser::Result::Unknown }

      it_behaves_like "returns the correct object with attributes"

    end

    context "when source is referrer" do

      context "and isn't a recognized referrer" do

          # source: domain (ajuda.rdstation.com.br)
           # campaign: (referral)
           # channel: "Referral",
           # medium: referral
           # content: /xunda


           let(:sources) do
            [
              {
                cookie_value: "http://shipit.resultadosdigitais.com.br/trabalhe-conosco/",
                source:  "resultadosdigitais.com.br",
                medium: "referral",
                campaign: "(referral)",
                channel: "Referral",
                term: "/trabalhe-conosco/"
                },
                {
                  cookie_value: "https://thoughtbot.com/locations",
                  source:  "thoughtbot.com",
                  medium: "referral",
                  campaign: "(referral)",
                  channel: "Referral",
                  term: '/locations'

                  },
                  {
                    cookie_value: "https://rubygems.org/",
                    source:  "rubygems.org",
                    medium: "referral",
                    campaign: "(referral)",
                    channel: "Referral",

                    },
                    {
                      cookie_value: "https://www.ruby-lang.org/en/about/",
                      source:  "ruby-lang.org",
                      medium: "referral",
                      campaign: "(referral)",
                      channel: "Referral",
                      term: '/en/about/'
                      },
                      {
                        cookie_value: "http://www.hdtecnologia.com.br/gestao-de-compras-sistema-de-gestao/",
                        source:  "hdtecnologia.com.br",
                        medium: "referral",
                        campaign: "(referral)",
                        channel: "Referral"
                        }
                    ]
                  end

                  let(:klass) {  TrafficSourceParser::Result::Generic }

                  it_behaves_like "returns the correct object with attributes"

                end

                context "and is a recognized social network" do

                  let(:sources) do
                    [
                      {
                        cookie_value: "https://www.facebook.com/",
                        source: "Facebook",
                        medium: "social",
                        channel: "Social"
                        },
                        {
                          cookie_value:  "http://t.co/W1pX6dNa2V",
                          source: "Twitter",
                          medium: "social",
                          channel: "Social"
                          },
                          {
                            cookie_value: "https://www.linkedin.com/",
                            source: "LinkedIn",
                            medium: "social",
                            channel: "Social"
                            },
                            {
                              cookie_value: "http://plus.url.google.com/url",
                              source: "Google Plus",
                              medium: "social",
                              channel: "Social"
                              },
                              {
                                cookie_value: "https://www.pinterest.com/",
                                source: "Pinterest",
                                medium: "social",
                                channel: "Social"
                              }
                            ]
                          end

                          let(:klass) { TrafficSourceParser::Result::Social }

                          it_behaves_like "returns the correct object with attributes"

                        end

                        context "and is a recognized search egine" do

                          let(:sources) do
                            [
                              {
                                cookie_value: "http://r.search.yahoo.com/_ylt=AwrBTv5RjZpVbJ8A" +
                                "J23z6Qt.;_ylu=X3oDMTE0MjJuYj…2fshipit.resultado" +
                                "sdigitais.com.br%2f/RK=0/RS=Y_bOYZ72hkyElUK0URY" +
                                "LlSFeQUo-",
                                source: "Yahoo",
                                medium: "organic",
                                channel: "Organic Search"
                                },
                                {
                                  cookie_value: "http://www.bing.com/search?q=shipit+resultados" +
                                  "+digitais&go=Submit&qs=n&form…esultados+digita" +
                                  "is&sc=1-27&sp=-1&sk=&cvid=df2f6cabe2d343e9ab98" +
                                  "d90a98fcc5c5",
                                  source: "Bing", term: "shipit resultados digitais",
                                  medium: "organic",
                                  channel: "Organic Search" },
                                  {
                                    cookie_value: "https://www.google.com.br/",
                                    source: "Google",
                                    medium: "organic",
                                    channel: "Organic Search"
                                  },
                                  {
                                    cookie_value: "http://www.google.com.br/aclk?sa=L&ai=CpAvNEJYNVo2ZCs2CxgT08bso0PC4mAag_PCc…wnfiMosgCFciNkAodhxAKxQ",
                                    source: "Google",
                                    medium: "cpc",
                                    channel: "Paid Search"
                                  },
                                  {
                                    cookie_value: "https://br.search.yahoo.com/search?p=cerveja&fr=yfp-t-204",
                                    source: "Yahoo",
                                    medium: "cpc",
                                    channel: "Paid Search",
                                    term: "cerveja"
                                  }

                                  ]
                                end

                                let(:klass) { TrafficSourceParser::Result::Search }

                                it_behaves_like "returns the correct object with attributes"

                              end
                            end

                          end

                        end
