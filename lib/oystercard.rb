class Oystercard
  attr_reader :balance, :active
  DEFAULT_BALANCE = 0
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  ERROR_MAX_CAPACITY = "Error! top up beyond limit"

  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
    @active = false
  end

  def top_up(balance)
    fail "Error! top up beyond limit" if @balance + balance > MAX_CAPACITY
    @balance += balance
  end

  def in_journey?
    @active
  end

  def touch_in
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @active = true
  end

  def touch_out
    @active = false
    deduct(MIN_BALANCE)
  end

private

def deduct(balance)
  @balance -= balance
end

end
