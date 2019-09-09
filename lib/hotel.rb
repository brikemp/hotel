require_relative 'reservation'

class Hotel
  attr_reader :reservations, :rooms
  
  def initialize(reservations: nil) 
    @reservations = reservations || []
    @rooms = [*1..20]
  end
  
  def make_reservation(start_date:, end_date:, block:false)
    id = @reservations.length + 1
    room = list_available_rooms(start_date, end_date).sample
    reservation = Reservation.new(start_date:start_date, end_date:end_date, room:room, block:block, reservation_id:id)
    reservations.push(reservation)
    return reservation
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
