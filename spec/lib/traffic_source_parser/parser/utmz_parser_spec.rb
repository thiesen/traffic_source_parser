require 'spec_helper'

describe TrafficSourceParser::Parser::UtmzParser do

  describe '.parse' do

    subject { TrafficSourceParser::Parser::UtmzParser.parse(cookie) }

    context 'when source is utmz' do

      context 'when value is from direct' do
        let(:cookie) { '153788330.1432828657.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none)' }
        let(:campaign) { '(direct)' }
        let(:medium) { '(none)' }
        let(:channel) { 'Direct' }
        let(:source) { '(direct)' }

        it_behaves_like 'a traffic source campaign parser'
      end

      context 'when value is from social' do

        context 'with content and from referral medium' do
          let(:cookie) { '231152653.1432828491.1.1.utmcsr=t.co|utmccn=(referral)|utmcmd=referral|utmcct=/EFzCFawFrk' }
          let(:campaign) { '(referral)' }
          let(:medium) { 'referral' }
          let(:channel) { 'Social' }
          let(:source) { 'Twitter' }
          let(:content) { '/EFzCFawFrk' }

          it_behaves_like 'a traffic source campaign parser with content'
        end

        context 'with content and from custom medium' do
          let(:cookie) { '1.1111111111.1.1.utmcsr=facebook|utmccn=experimentar-ferramenta|utmcmd=sponsored-post|utmctr=|utmcct=organize-seus-negocios' }
          let(:campaign) { 'experimentar-ferramenta' }
          let(:medium) { 'sponsored-post' }
          let(:channel) { 'Social' }
          let(:source) { 'Facebook' }
          let(:content) { 'organize-seus-negocios' }

          it_behaves_like 'a traffic source campaign parser with content'
        end

        context 'without content' do
          let(:cookie) { '10083233.1432828099.1.1.utmcsr=facebook.com|utmccn=20150528-ef-aprovacaoharvard|utmcmd=socialmedia-fe' }
          let(:campaign) { '20150528-ef-aprovacaoharvard' }
          let(:medium) { 'socialmedia-fe' }
          let(:channel) { 'Social' }
          let(:source) { 'Facebook' }

          it_behaves_like 'a traffic source campaign parser'
        end

      end

    end

  end

end
