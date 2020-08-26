require './lib/journey.rb'

class Card
  MAX_VALUE = 90
  MIN_FARE = 3
  BALANCE = 0

  def initialize(journey: Journey)
    @balance = BALANCE
    @journey = journey
    @completed_journies = []
  end
  
  def balance
    return "Balance less than minimum fare" if @balance < MIN_FARE

    @balance    
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
    if @balance >= MIN_FARE
      @balance -= MIN_FARE    
    end
    @completed_journies << @current_journey
    @current_journey.end_point
  end

  def pretty_print_journies
    @completed_journies.map do |journey|
      "#{journey.start_point}, #{journey.end_point}"
    end.join("\n")
  end

  private

  def too_much?(money)
    @balance + money > MAX_VALUE
  end
end
