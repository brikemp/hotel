# coordinates management of hotel

class Hotel
  attr_reader :rooms, :reservations
  
  def initialize(reservations: nil) 
    @rooms = [*1..20]
    @reservations = reservations || []
  end
  
  def res_by_date(date)
    @resevations.find { |reservtion| start_date == date} # or end_date == date
  end
  
  
  # is room available method, look at given dates and see if room is available for those dates
  
end