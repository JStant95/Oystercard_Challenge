
class Oystercard
  attr_reader :balance, :in_journey

  LIMIT = 90
  MINIMUM_VALUE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(value)
    fail "Balance limit reached: #{LIMIT}" if value + balance > LIMIT

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end
  
  def touch_in
    fail "Balance bellow minimum" if balance < MINIMUM_VALUE
    @in_journey = true
  end
  
  def touch_out
    deduct(MINIMUM_VALUE)
    @in_journey = false
  end
  
end