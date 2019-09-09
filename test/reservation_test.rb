require_relative 'test_helper'

describe "Reservation class" do
  
  describe "Reservation instantiation" do
    before do
      @reservation = Reservation.new(start_date:"5/05/2019", end_date:"5/09/2019")
    end
    
    it "is an instance of Reservation" do
      expect(@reservation).must_be_kind_of Reservation
    end
    
    it "is set up for specific attributes and data types" do
      [:user_id, :start_date, :end_date].each do |prop|
        expect(@reservation).must_respond_to prop
      end
      expect(@reservation.room).must_be_kind_of Integer
      expect(@reservation.user_id).must_be_kind_of Integer
      expect(@reservation.start_date).must_be_kind_of Date
      expect(@reservation.end_date).must_be_kind_of Date
    end
    
    it "calculates reservation cost correctly for non-block booking" do
      expect(@reservation.cost).must_equal 800
    end
    
  end
  
  describe "Validates reservations dates" do
    it "does not allow end date before start date" do
      expect { Reservation.new(start_date:"5/09/2019", end_date:"5/08/2019") }.must_raise ArgumentError
    end
    
    it "does not allow end date and start date to be the same" do
      expect { Reservation.new(start_date:"5/08/2019", end_date:"5/08/2019") }.must_raise ArgumentError
    end
    
    it"does not allow invalid dates" do
      expect { Reservation.new(start_date:"14/08/2019", end_date:"5/08/2019") }.must_raise ArgumentError
    end
  end
  
end