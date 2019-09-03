require_relative 'test_helper'

describe "Reservation class" do
  
  describe "Reservation instantiation" do
    before do
      @reservation = Reservation.new(room: 5, user_id: 34, start_date:"5/05/2019", end_date:"5/09/2019")
    end
    
    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Reservation
    end
    
    it "is set up for specific attributes and data types" do
      [:room, :user_id, :start_date, :end_date].each do |prop|
        expect(@reservation).must_respond_to prop
      end
      expect(@reservation.room).must_be_kind_of Integer
      expect(@reservation.user_id).must_be_kind_of Integer
      expect(@reservation.start_date).must_be_kind_of Date
      expect(@reservation.end_date).must_be_kind_of Date
    end
  end
end