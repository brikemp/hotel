require 'date'
require_relative 'hotel'

class Reservation
  attr_reader :room, :start_date, :end_date, :block, :reservation_id, :cost
  ROOM_COST = 200
  DISCOUNT = 0.20
  
  def initialize(start_date:, end_date:, room:, block:false, reservation_id:)
    @start_date = Date.strptime(start_date, "%m/%d/%Y")
    @end_date = Date.strptime(end_date, "%m/%d/%Y")   
    @room = room
    @block = block
    @reservation_id = reservation_id
    @cost = @block == false ? ROOM_COST * (@end_date - @start_date).to_i : ROOM_COST * DISCOUNT * (@end_date - @start_date).to_i
    
    if start_date == nil || end_date == nil || end_date <= start_date
      raise ArgumentError.new("Please enter a valid date range")
    end
  end
  
end