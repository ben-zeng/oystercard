require_relative 'journey'

class Oystercard
  attr_reader :balance, :entry_station, :journeys
  DEFAULT_BALANCE = 0
  MAX_CAPACITY = 90
  MIN_BALANCE = 1
  ERROR_MAX_CAPACITY = "Error! top up beyond limit"


  def initialize(balance: DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
  end

  def top_up(balance)
    fail "Error! top up beyond limit" if @balance + balance > MAX_CAPACITY
    @balance += balance
  end

  def touch_in(entry_station)
    fail "Insufficient funds" if @balance < MIN_BALANCE
    @new_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @new_journey.end_journey(exit_station)
    @journeys << { :entry_stn => @new_journey.entry_station, :exit_stn => @new_journey.exit_station }
    deduct
  end

private

  def deduct
    @balance -= @new_journey.fare
  end

end
