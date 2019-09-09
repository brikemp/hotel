require_relative 'test_helper'

describe "Hotel class" do
  
  describe "Hotel instantiation" do
    before do
      @hotel = Hotel.new()
    end
    
    it "is an instance of Hotel" do
      expect(@hotel).must_be_kind_of Hotel
    end
    
    it "has correct attributes" do
      [:rooms, :reservations].each do |prop|
        expect(@hotel).must_respond_to prop
      end
      expect(@hotel.rooms).must_be_kind_of Array
      expect(@hotel.rooms.length).must_equal 20
      expect(@hotel.reservations).must_be_kind_of Array
    end
  end
  
  describe "Makes reservations correctly and finds appropriate rooms" do
    it "removes booked room from eligible room list" do
      hotel = Hotel.new 
      @reservation = hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:1)
      room = @reservation.room
      available_rooms = hotel.list_available_rooms("5/05/2019", "5/09/2019")
      
      expect(available_rooms.include?(room)).must_equal false
    end
    
    it "raises argument error when there are no rooms available" do
      hotel = Hotel.new
      expect { 21.times do
        hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:1)
      end }.must_raise ArgumentError
    end
    
    it "instantiates Reservation" do
      hotel = Hotel.new
      @reservation = hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:1)
      
      expect(@reservation).must_be_kind_of Reservation
    end
  end
  
  describe "Find reservation by date" do
    it "lists all reservation for a date range" do
      hotel = Hotel.new 
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:1)
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:2)
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:3)
      found_reservations = hotel.find_reservations_by_date("5/05/2019","5/09/2019")
      
      expect(found_reservations.length).must_equal 3
    end
    
    it "does not list reservations outside of date range" do
      hotel = Hotel.new 
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:1)
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:2)
      hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", reservation_id:3)
      hotel.make_reservation(start_date:"5/09/2019", end_date:"5/10/2019", reservation_id:4)
      found_reservations = hotel.find_reservations_by_date("5/05/2019","5/09/2019")
      
      expect(found_reservations.length).must_equal 3
    end
  end
end

