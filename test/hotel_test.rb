require_relative 'test_helper'

describe "Hotel class" do
  
  describe "Hotel instantiation" do
    before do
      @hotel = Hotel.new()
    end
    
    it "is an instance of Hotel" do
      expect(@hotel).must_be_kind_of Hotel
    end
    
    it "is set up for specific attributes and data types" do
      [:rooms, :reservations].each do |prop|
        expect(@hotel).must_respond_to prop
      end
      expect(@hotel.rooms).must_be_kind_of Array
      expect(@hotel.reservations).must_be_kind_of Array
    end
    
    # Rooms belongs in hotel
    it "has the correct number of rooms" do
      expect(@hotel.rooms).must_be_kind_of Array
    end
  end
  
  describe "Assigns rooms correctly" do
    it "removes booked room from eligible room list" do
      @reservation = Hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019")
      room = @reservation.room
      available_rooms = Hotel.list_available_rooms("5/05/2019", "5/09/2019")
      
      expect(available_rooms.include?(room)).must_equal false
    end
    
    it "raises argument error when there are no rooms available" do
      
      expect { 21.times do
        Hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019")
      end }.must_raise ArgumentError
    end
    
  end
end

