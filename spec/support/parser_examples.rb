shared_examples_for 'a traffic source campaign parser' do

  it 'should have campaign correctly set' do
    expect(subject.campaign).to eq campaign
  end

  it 'should have medium correctly set' do
    expect(subject.medium).to eq medium
  end

  it 'should have source correctly set' do
    expect(subject.source).to eq source
  end

  it 'should have channel correctly set' do
    expect(subject.channel).to eq channel
  end

end

shared_examples_for 'a traffic source campaign parser with content' do

  it_behaves_like 'a traffic source campaign parser'

  it 'should have content correctly set' do
    expect(subject.content).to eq content
  end

end

shared_examples_for 'a traffic source campaign parser with term' do

  it_behaves_like 'a traffic source campaign parser'

  it 'should have term correctly set' do
    expect(subject.term).to eq term
  end

end
