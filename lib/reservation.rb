require 'date'
# tracks reservations that are made
class Reservation
  attr_reader :room, :user_id, :start_date, :end_date, :block, :reservation_id, :cost
  ROOM_COST = 200
  @@rooms = [*1..20]
  @@all = []
  
  def initialize(user_id:, start_date:, end_date:, block:false)
    @room = @@rooms.sample
    @user_id = user_id
    @start_date = Date.strptime(start_date, "%m/%d/%Y")
    @end_date = Date.strptime(end_date, "%m/%d/%Y")    
    @block = block
    @reservation_id = [1,2,3,4,5].sample # add random id or sequential 
    @cost = ROOM_COST * (@end_date - @start_date).to_i# unless it's a block
    
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