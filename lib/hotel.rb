require_relative 'reservation'
require_relative 'block'

class Hotel
  attr_reader :reservations, :rooms, :blocks
  
  def initialize(reservations: nil, blocks:nil) 
    @reservations = reservations || []
    @blocks = blocks || []
    @rooms = [*1..20]
  end
  
  def book_block
    
  end
  
  def make_reservation(start_date:, end_date:, hold_block:false, block_id:nil, block_reservation:nil)
    # need if booking from block
    if hold_block != false && hold_block.to_s.match(/[1-5]/) == nil # || ( || ) 
      raise ArgumentError.new("If you want hold a block of rooms, enter the number of rooms to hold.")
    elsif hold_block == false
      id = @reservations.length + 1
      room = list_available_rooms(start_date, end_date).sample
      reservation = Reservation.new(start_date:start_date, end_date:end_date, room:room, reservation_id:id)
      reservations.push(reservation)
      return reservation
    elsif hold_block.to_s.match(/[1-5]/) != nil
      reservation_block = {}
      available_count = list_available_rooms(start_date, end_date).length
      if available_count < hold_block
        raise ArgumentError.new("Not enough rooms available for this block")
      end
      hold_block.times do
        id = @reservations.length + 1
        room = list_available_rooms(start_date, end_date).sample
        reservation = Reservation.new(start_date:start_date, end_date:end_date, room:room, reservation_id:id)
        # either push all or none if all rooms available
        reservations.push(reservation)
        reservation_block[reservation] = "Not booked"
      end
      id = @blocks.length + 1
      block = new.Block(block:reservation_block, block_id:id)
      return block
      # elsif block_id != nil
      #   # resrerve a room for block
    end
  end
  
  
  def find_reservations_by_date(start_date, end_date)
    if start_date.class == String
      start_date = Date.strptime(start_date, "%m/%d/%Y")
    end
    if end_date.class == String
      end_date = Date.strptime(end_date, "%m/%d/%Y") 
    end
    found_reservations = []
    if @reservations != nil
      @reservations.each do |reservation|
        date = start_date.dup
        until date == end_date do
          if (start_date >= reservation.start_date && start_date < reservation.end_date) || (end_date > reservation.start_date && end_date <= reservation.end_date)
            found_reservations.push(reservation)
            break
          end
          date += 1
        end
      end
    end
    return found_reservations
  end
  
  def list_available_rooms(start_date, end_date)
    if start_date.class == String
      start_date = Date.strptime(start_date, "%m/%d/%Y")
    end
    if end_date.class == String
      end_date = Date.strptime(end_date, "%m/%d/%Y") 
    end
    occupied_rooms = []
    if @reservations != nil
      @reservations.each do |reservation|
        date = start_date.dup
        until date == end_date do
          if (start_date >= reservation.start_date && start_date < reservation.end_date) || (end_date > reservation.start_date && end_date <= reservation.end_date)
            occupied_rooms.push(reservation.room)
            break
          end
          date += 1
        end
      end
    end
    rooms = @rooms.dup
    occupied_rooms.each do |room|
      rooms.delete(room)
    end
    if rooms.length == 0
      raise ArgumentError.new("Sorry! We are currently all booked for those days, pleae try again.") 
    end
    return rooms
  end
  
end
