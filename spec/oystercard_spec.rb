require 'oystercard'

describe Oystercard do

  before(:each) { subject.top_up(5) }
  
  it '#balence of the new card should be equal 0' do
    expect(subject.balance).to eq 5
  end

  it '#top_up should be able to add to the balance' do
    expect(subject.balance).to eq 5
  end

  it '#top_up should able to add to curent balnce' do
    2.times { subject.top_up(15) }
    expect(subject.balance).to eq 35
  end

  it 'should have balance limit of 90' do
    message = "Balance limit reached: #{Oystercard::LIMIT}"
    expect { subject.top_up(91) }.to raise_error message
  end

  it 'should be able to #deduct from balance' do
    expect(subject.deduct(5)).to eq 0
  end

end