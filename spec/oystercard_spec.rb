require 'oystercard'

describe Oystercard do

  describe '#balance, #top_up and #deduct' do
    before(:each) { subject.top_up(Oystercard::MINIMUM_VALUE) }

    it '#top_up should be able to add to the balance' do
      expect(subject.balance).to eq Oystercard::MINIMUM_VALUE
    end

    it '#top_up should able to add to curent balnce' do
      expect { 2.times { subject.top_up(15) } }.to change{ subject.balance }.by(30)
    end

    it 'should have balance limit of 90' do
      message = "Balance limit reached: #{Oystercard::LIMIT}"
      expect { subject.top_up(91) }.to raise_error message
    end

    it 'should be able to #deduct from balance' do
      expect(subject.deduct(Oystercard::MINIMUM_VALUE)).to eq 0
    end
  end


  describe 'in_journey, touch_in and touch_out' do
    before(:each) { subject.top_up(Oystercard::MINIMUM_VALUE) }
    let(:station) { double :station }


    it 'when card created #in_journey? should be eq to false' do
      expect(subject.in_journey?).to eq false
    end

    it 'in_journey? should return true when #touch_in' do
      subject.touch_in(station)
      expect(subject.in_journey?).to eq true
    end

    it 'in_journey? should return to false after touching out' do
      subject.touch_in station
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end

    it 'should have a minimum of a 1£ when #touch_in' do
      subject.deduct(Oystercard::MINIMUM_VALUE)
      message = "Balance bellow minimum"
      expect { subject.touch_in(station) }.to raise_error message
    end

    it 'should be able to charge for the journey' do
      expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_VALUE)
    end

    it 'should know name of the station up on #touch_in' do
      subject.touch_in(station)
      expect(subject.entry_station).to eq(station)
    end
  end
end
