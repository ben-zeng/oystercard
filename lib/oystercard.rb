class Oystercard
  attr_reader :balance, :active
  DEFAULT_BALANCE = 0
  MAX_CAPACITY = 90
  ERROR_MAX_CAPACITY = "Error! top up beyond limit"

  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
    @active = false
  end

  def top_up(balance)
    fail ERROR_MAX_CAPACITY if @balance + balance > MAX_CAPACITY
    @balance += balance
  end

  def deduct(balance)
    #fail ERROR_MAX_CAPACITY if @balance + balance > MAX_CAPACITY
    @balance -= balance
  end

  def in_journey?
    @active
  end

  def touch_in
    @active = true
  end

  def touch_out
    @active = false
  end

end
