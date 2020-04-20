
class Oystercard
  attr_reader :balance, :entry_station

  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(value)
    fail "Balance limit reached: #{LIMIT}" if value + balance > LIMIT

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in(station)
    fail "Balance bellow minimum" if balance < MINIMUM_VALUE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_VALUE)
    @entry_station = nil
  end

  def in_journey?
    if entry_station
      true
    else
      false
    end
  end

end
