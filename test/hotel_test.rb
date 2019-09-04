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
    
    it "has the correct number of rooms" do
      expect(@hotel.rooms).must_be_kind_of Array
    end
  end
end