require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

In the last question Alyssa showed Alan this code which keeps track of items for a shopping cart application:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end
Alan noticed that this will fail when update_quantity is called. Since quantity is an instance variable,
it must be accessed with the @quantity notation when setting it. One way to fix this is to change
attr_reader to attr_accessor and change quantity to self.quantity.

Is there anything wrong with fixing it this way?
=end

class QuestionThreeTest < Minitest::Test
  class InvoiceEntry
    attr_reader :product_name
    attr_accessor :quantity

    def initialize(product_name, number_purchased)
      @quantity = number_purchased
      @product_name = product_name
    end

    def update_quantity(updated_count)
      self.quantity = updated_count if updated_count >= 0
    end
  end

  def test_1
    # using the setter for the quantitiy attribute
    # works BUT now the setter itself can be used to change
    # the quantity without the guard condition, that is
    # instance.quantity = <new quantity>
    entry = InvoiceEntry.new("Macbook Pro", 2)
    original_amount = entry.quantity
    entry.update_quantity(4)
    current_amount = entry.quantity
    assert_equal([2, 4], [original_amount, current_amount])
  end
end