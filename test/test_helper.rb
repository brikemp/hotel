require 'simplecov'
SimpleCov.start do
  add_filter 'test/' # Tests should not be counted toward coverage.
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require 'simplecov'
require 'date'


Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative '../lib/hotel.rb'
require_relative '../lib/reservation.rb'
# require_relative '../lib/block.rb'
