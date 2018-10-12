require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExercisesOneTest < Minitest::Test
  module Mailable
    def print_address
      "#{name}\n#{address}\n#{city}, #{state} #{zipcode}"
    end
  end

  class Person
    include Mailable
    attr_reader :name, :address, :city, :state, :zipcode

    def initialize(name)
      @name = name
    end

    def address_information(address, city, state, zipcode)
      @address = address
      @city = city
      @state = state
      @zipcode = zipcode
    end
  end


  class Customer < Person
  end

  class Employee < Person
  end

  def test_one
    customer = Customer.new("Elmer Fudd")
    customer.address_information("6106 Sherborn Lane", "Springfield", "Virginia", 22152)
    expected = "Elmer Fudd\n6106 Sherborn Lane\nSpringfield, Virginia 22152"
    assert_equal(expected, customer.print_address)
  end

  def test_two
    empolyee = Employee.new("Foghorn Leghorn")
    empolyee.address_information("13773 Charismatic Way", "Gainesville", "Virginia", 20155)
    expected = "Foghorn Leghorn\n13773 Charismatic Way\nGainesville, Virginia 20155"
    assert_equal(expected, empolyee.print_address)
  end

end