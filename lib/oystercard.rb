
class Oystercard
  LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "Balance limit reached: #{LIMIT}" if value + balance > LIMIT

    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

end