class Oystercard
  attr_reader :balance
  DEFAULT_BALANCE = 0
  MAX_CAPACITY = 90
  ERROR_MAX_CAPACITY = "Error! top up beyond limit"

  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(balance)
    fail ERROR_MAX_CAPACITY if @balance + balance > MAX_CAPACITY
    @balance += balance
  end

end
