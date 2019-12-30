require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFiveTest < Minitest::Test
  class Person

    def initialize(first_name, last_name)
      @first_name = first_name.capitalize
      @last_name = last_name.capitalize
    end

    def first_name=(first_name)
      @first_name = first_name.capitalize
    end

    def last_name=(last_name)
      @last_name = last_name.capitalize
    end

    def to_s
      "#{@first_name} #{@last_name}"
    end
  end

  def test_one
    person = Person.new('john', 'doe')
    first = person.to_s
    person.first_name = 'jane'
    person.last_name = 'smith'
    second = person.to_s

    expected = [
      'John Doe', 'Jane Smith'
    ]
    assert_equal(expected, [first, second])
  end
end