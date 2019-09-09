require 'date'
require_relative 'hotel'

class Reservation
  attr_reader :room, :user_id, :start_date, :end_date, :block, :reservation_id, :cost
  ROOM_COST = 200
  # @@rooms = [*1..20]
  
  def initialize(start_date:, end_date:, block:false)
    @start_date = Date.strptime(start_date, "%m/%d/%Y")
    @end_date = Date.strptime(end_date, "%m/%d/%Y")   
    @room = Hotel.list_available_rooms(@start_date, @end_date).sample 
    @block = block
    @reservation_id = [1,2,3,4,5].sample # add random id or sequential 
    @cost = ROOM_COST * (@end_date - @start_date).to_i # unless it's a block, then discount
    
    if start_date == nil || end_date == nil || end_date <= start_date
      raise ArgumentError.new("Please enter a valid date range")
    end
    
  end
  
  def self.all
    @@all
  end
  
  
end