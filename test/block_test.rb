require_relative 'test_helper'

describe "Block class" do
  
  describe "Block instantiation" do
    before do
      @hotel = Hotel.new
      @block = @hotel.make_reservation(start_date:"5/05/2019", end_date:"5/09/2019", hold_block:4)
    end
    
    it "is an instance of Reservation" do
      expect(@block).must_be_kind_of Block
    end
    
    it "has correct attributes" do
      [:reservations, :block_id].each do |prop|
        expect(@block).must_respond_to prop
      end
      expect(@block.reservations).must_be_kind_of Hash
      expect(@block.block_id).must_be_kind_of Integer
    end
    
  end
end 