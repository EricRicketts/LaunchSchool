require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseOneTest < Minitest::Test
  class LibraryWithError
    attr_accessor :address, :phone, :books

    def initialize(address, phone)
      @address = address
      @phone = phone
      @books = []
    end

    def check_in(book)
      books.push(book)
    end
  end

  class Book
    attr_accessor :title, :author, :isbn

    def initialize(title, author, isbn)
      @title = title
      @author = author
      @isbn = isbn
    end

    def display_data
      "---------------\n"\
      "Title: #{title}\n"\
      "Author: #{author}\n"\
      "ISBN: #{isbn}\n"\
      "---------------\n"
    end
  end

  class Library
    attr_accessor :address, :phone, :books

    def initialize(address, phone)
      @address = address
      @phone = phone
      @books = []
    end

    def check_in(book)
      books.push(book)
    end

    def list_books
      books.each { |book| book.display_data }
    end
  end

  class Book
    attr_accessor :title, :author, :isbn

    def initialize(title, author, isbn)
      @title = title
      @author = author
      @isbn = isbn
    end

    def display_data
      "---------------\n"\
      "Title: #{title}\n"\
      "Author: #{author}\n"\
      "ISBN: #{isbn}\n"\
      "---------------\n"
    end
  end

  def test_flawed_library
    community_library = LibraryWithError.new('123 Main St.', '555-232-5652')
    learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
    little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
    wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

    community_library.check_in(learn_to_program)
    community_library.check_in(little_women)
    community_library.check_in(wrinkle_in_time)

    # the problem here is that Book#display_data is being called on an array not a Book object
    assert_raises(NoMethodError) { community_library.books.display_data }
  end

  def test_library
    community_library = Library.new('123 Main St.', '555-232-5652')
    learn_to_program = Book.new('Learn to Program', 'Chris Pine', '978-1934356364')
    little_women = Book.new('Little Women', 'Louisa May Alcott', '978-1420951080')
    wrinkle_in_time = Book.new('A Wrinkle in Time', 'Madeleine L\'Engle', '978-0312367541')

    community_library.check_in(learn_to_program)
    community_library.check_in(little_women)
    community_library.check_in(wrinkle_in_time)
    expected = <<-EXPECTED
---------------
Title: Learn to Program
Author: Chris Pine
ISBN: 978-1934356364
---------------
---------------
Title: Little Women
Author: Louisa May Alcott
ISBN: 978-1420951080
---------------
---------------
Title: A Wrinkle in Time
Author: Madeleine L'Engle
ISBN: 978-0312367541
---------------
EXPECTED

    assert(expected, community_library.list_books)
  end

end