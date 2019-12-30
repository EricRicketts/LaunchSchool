require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseTwoTest < Minitest::Test
class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBirdTooMuch < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class FlightlessBird < Bird
  def move
    puts "I'm running!"
  end
end

class SongBirdWithError < Bird
  def initialize(diet, superpower, song)
    super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

  def test_one
    # an ArugmentError is raised because in line 48 of the code, super is called without any arguments, in so doing
    # it takes all of the arguments provided by the current method call, SongBirdWithError#initialize but 3 arguments
    # are provided by this method but Bird#initialize (which inherits #initialize from Animal) only takes 2 arguments
    assert_raises(ArgumentError) { SongBirdWithError.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr') }
  end

  def test_two
    assert_output(/I'm flying!/) { SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr').move }
  end

  def test_three
    assert_output(/I'm running!/) { FlightlessBirdTooMuch.new(:carnivore, 'drink sea water').move }
  end

  def test_four
    # the FlightlessBirdTooMuch#initialize method is not needed since FlightlessBird inherits from Bird
    # which inherits from Animal, a constructor is defined via the inheritance chain
    assert_output(/I'm running!/) { FlightlessBird.new(:carnivore, 'drink sea water').move }
  end
end