require 'date'

class Block
  attr_reader :rooms, :start_date, :end_date, :reservation_id
  
  def initialize(start_date:, end_date:, rooms:, reservation_id:)
    @start_date = Date.strptime(start_date, "%m/%d/%Y")
    @end_date = Date.strptime(end_date, "%m/%d/%Y")   
    @rooms = rooms
    @reservation_id = reservation_id
    
    if start_date == nil || end_date == nil || end_date <= start_date
      raise ArgumentError.new("Please enter a valid date range")
    end
    if rooms.length > 5
      raise ArgumentError.new("Maximum of 5 rooms allowed")
    end
  end
  
end