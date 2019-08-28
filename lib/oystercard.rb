class Oystercard
  attr_reader :balance, :entry_station
  DEFAULT_BALANCE = 0
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  ERROR_MAX_CAPACITY = "Error! top up beyond limit"


  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(balance)
    fail "Error! top up beyond limit" if @balance + balance > MAX_CAPACITY
    @balance += balance
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end

private

def deduct(balance)
  @balance -= balance
end

end
