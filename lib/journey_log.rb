require_relative 'journey'

class JourneyLog

  attr_reader :journey

  def initialize(journey_class:)
    @journey = journey_class
  end

end