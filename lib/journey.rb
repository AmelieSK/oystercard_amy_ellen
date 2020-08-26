class Journey
  def start(station)
    @start_point = station
  end

  def start_point
    @start_point.name
  end

  def end(station)
    @end_point = station
  end

  def end_point
    @end_point.name
  end
end
