require 'oystercard'

describe Oystercard do
  
  it '#balence of the new card should be equal 0' do
    expect(subject.balance).to eq 0
  end

  it '#top_up should be able to add to the balance' do
    subject.top_up(5)
    expect(subject.balance).to eq 5
  end

  it '#top_up should able to add to curent balnce' do
    2.times { subject.top_up(15) }
    expect(subject.balance).to eq 30
  end

end