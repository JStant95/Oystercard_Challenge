require 'oystercard'

describe Oystercard do
  
  it '#balence of the new card should be equal 0' do
    expect(subject.balance).to eq 0
  end

end