require 'date'
# tracks reservations that are made
class Reservation
  attr_reader :room, :user_id, :start_date, :end_date
  
  ROOM_COST = 200
  @@all = []
  
  def initialize(room:, user_id:, start_date:, end_date:)
    @room = room
    @user_id = user_id
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
    @reservation_id = [1,2,3,4,5].sample # add random id or sequential 
    if start_date == nil || end_date == nil || end_date <= start_date
      raise ArgumentError.new("Please enter a valid date range")
    end
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  
  
  
  # tracking for blocks, reservation needs to reference block id 
  
  
  
  
  
end