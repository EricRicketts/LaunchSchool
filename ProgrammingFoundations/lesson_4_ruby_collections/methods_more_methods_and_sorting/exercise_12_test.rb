require 'minitest/autorun'
require 'minitest/pride'

class Exercise12Test < Minitest::Test
  def test_order_array_of_hashes
    books = [
      {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
      {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
      {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
      {title: 'Ulysees', author: 'James Joyce', published: '1922'}
    ]
    result = books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }
    expected = [
      {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
      {:title=>"Ulysees", :author=>"James Joyce", :published=>"1922"},
      {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"}, 
      {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
    ]
    assert_equal expected, result
  end
end