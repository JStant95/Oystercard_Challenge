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

  it { is_expected.to respond_to :in_journey }

  it 'when card created #in_journey should be eq to false' do
    expect(subject.in_journey).to eq false
  end

  it 'should change @in_journey to true when #touch_in' do
    subject.touch_in  
    expect(subject.in_journey).to eq true 
  end

  it 'should change @in_journey to false when #touch_out' do
    subject.touch_in
    expect(subject.touch_out).to eq false
  end

  it 'should have a minimum of a 1£ when #touch_in' do 
    subject.deduct(5)
    message = "Balance bellow minimum"
    expect { subject.touch_in }.to raise_error message
  end

end