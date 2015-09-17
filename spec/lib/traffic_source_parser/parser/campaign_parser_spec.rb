require 'spec_helper'

describe TrafficSourceParser::Parser::CampaignParser do

  describe '.parse' do

    subject { TrafficSourceParser::Parser::CampaignParser.parse(cookie) }

    context 'when value is from referral' do
      let(:cookie) { 'utm_campaign=spring&utm_medium=referral&utm_source=exampleblog' }
      let(:campaign) { 'spring' }
      let(:medium) { 'referral' }
      let(:channel) { 'Referral' }
      let(:source) { 'exampleblog' }

      it_behaves_like 'a traffic source campaign parser'
    end

    context 'when value is from email' do
      let(:cookie) { 'utm_campaign=spring&utm_medium=email&utm_source=newsletter1' }
      let(:campaign) { 'spring' }
      let(:medium) { 'email' }
      let(:channel) { 'Email' }
      let(:source) { 'newsletter1' }

      it_behaves_like 'a traffic source campaign parser'

      context 'and has content' do
        let(:cookie) { 'utm_campaign=spring&utm_medium=email&utm_source=newsletter1&&utm_content=toplink' }
        let(:content) { 'toplink' }
        let(:channel) { 'Email' }

        it_behaves_like 'a traffic source campaign parser with content'
      end

      context 'and has term' do
        let(:cookie) { 'utm_source=Self+Test+List&utm_campaign=c2994af7da-xunda_mother_campaign&utm_medium=email&utm_term=0_f85d50388c-c2994af7da-69634449' }
        let(:campaign) { 'c2994af7da-xunda_mother_campaign' }
        let(:medium) { 'email' }
        let(:channel) { 'Email' }
        let(:source) { 'Self+Test+List' }
        let(:term) { '0_f85d50388c-c2994af7da-69634449' }

        it_behaves_like 'a traffic source campaign parser with term'
      end

    end

  end

end
