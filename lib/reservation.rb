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
  
  def self.list_occupied_rooms
    occupied_rooms = @@all.map do |reservation|
      reservation.room
    end
  end
  
  def self.list_available_rooms
    occupied_rooms = self.list_occupied_rooms
    rooms = @@rooms
    occupied_rooms.each do |room|
      rooms.delete(room)
    end
    return rooms
  end
  
  def self.list_occupied_rooms_with_date(start_date, end_date)
    start_date = Date.strptime(start_date, "%m/%d/%Y")
    end_date = Date.strptime(end_date, "%m/%d/%Y") 
    reservations = @@all.map
    occupied_rooms = []
    # is equal to or greater than???
    until start_date == end_date do
      reservations.each do |reservation|
        # 5/5/19 - 5/8/19 conflicts with 5/7/19 to 5/9/2019 X
        # 5/5/19 - 5/8/19 conflicts with 5/3/19 to 5/7/2019 X
        # 5/5/19 - 5/8/19 conflicts with 5/3/19 to 5/10/19 O
        # 5/5/19 - 5/8/19 conflicts with 5/5/19 to 5/8/19 X
        if (start_date >= reservation.start_date && start_date < reservation.end_date) || (end_date > reservation.start_date && end_date <= reservation.end_date)
          occupied_rooms.push(reservation.room)
        end
        start_date += 1
      end
    end
    rooms = @@rooms
    occupied_rooms.each do |room|
      rooms.delete(room)
    end
    return rooms
  end
  
  def self.list_available_rooms_with_date(start_date, end_date)
    occupied_rooms = self.list_occupied_rooms
    rooms = @@rooms
    occupied_rooms.each do |room|
      rooms.delete(room)
    end
    return rooms
  end
  # tracking for blocks, reservation needs to reference block id 
  
end