require './lib/journey.rb'

class Card
  MAX_VALUE = 90
  BALANCE = 0

  attr_reader :balance

  def initialize(journey: Journey)
    @balance = BALANCE
    @journey = journey
  end
  
  def max_value
    MAX_VALUE
  end

  def add(money)
    return 'You can only top up to £90 maximum' if too_much?(money)

    @balance = money
  end

  def touch_in(station)
    @current_journey = @journey.new
    @current_journey.start(station)
    @current_journey.start_point
  end

  def touch_out(station)
    @current_journey.end(station)
    @current_journey.end_point
  end

  private

  def too_much?(money)
    @balance + money > MAX_VALUE
  end
end
