# coordinates management of hotel

class Hotel
  attr_reader :reservations
  
  def initialize(reservations: nil) 
    @reservations = reservations || []
  end
  
  def res_by_date(date)
    @resevations.find { |reservtion| start_date == date} # or end_date == date
  end
  
  
  # is room available method, look at given dates and see if room is available for those dates
  
end