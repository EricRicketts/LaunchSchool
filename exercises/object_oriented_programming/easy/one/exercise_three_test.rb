require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseThreeTest < Minitest::Test
  class Book
    attr_reader :author, :title

    def initialize(author, title)
      @author = author
      @title = title
    end

    def to_s
      %("#{title}", by #{author})
    end
  end

  def test_one
    book = Book.new("Neil Stephenson", "Snow Crash")
    first_str = %(The author of "#{book.title}" is #{book.author}.)
    second_str = %(book = #{book}.)
    results = [first_str, second_str]
    expected = [
      "The author of \"Snow Crash\" is Neil Stephenson.",
      "book = \"Snow Crash\", by Neil Stephenson."
    ]
    assert_equal(expected, results)
  end
end