require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

Alyssa created the following code to keep track of items for a shopping cart application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end
Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.

Can you spot the mistake and how to address it?
=end

class QuestionTwoTest < Minitest::Test
  class InvoiceEntry
    attr_reader :quantity, :product_name

    def initialize(product_name, number_purchased)
      @quantity = number_purchased
      @product_name = product_name
    end

    def update_quantity(updated_count)
      # prevent negative quantities from being set
      @quantity = updated_count if updated_count >= 0
    end
  end

  def test_1
    # in this case since an attr_accessor was not
    # defined for quantity then the instance
    # variable itself needs to be used to change
    # the quantity
    entry = InvoiceEntry.new("Macbook Pro", 1)
    original_quantity = entry.quantity
    entry.update_quantity(2)
    current_quantity = entry.quantity
    assert_equal([1, 2], [original_quantity, current_quantity])
  end
end