require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFourTest < Minitest::Test
  class Book
    attr_accessor :title, :author

    def to_s
      %("#{title}", by #{author})
    end
  end

  def test_one
    book = Book.new
    book.author = 'Neil Stephenson'
    book.title = 'Snow Crash'
    str1 = %(The author of "#{book.title}" is #{book.author}.)
    str2 = %(book = #{book}.)
    expected = [
      "The author of \"Snow Crash\" is Neil Stephenson.",
      'book = "Snow Crash", by Neil Stephenson.'
    ]
    assert_equal(expected, [str1, str2])
  end
end