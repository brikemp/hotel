require 'date'

class Block
  attr_reader :reservations, :block_id
  
  def initialize(reservations, block_id)
    @reservations = reservations
    @block_id = block_id
    
  end
  
end