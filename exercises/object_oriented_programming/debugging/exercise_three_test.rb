require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseThreeTest < Minitest::Test
class PersonNoFix
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocationNoFix.new(latitude, longitude)
  end
end

class GeoLocationNoFix
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def ==(other)
    latitude == other.latitude && longitude == other.longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

def test_one
  ada = PersonNoFix.new('Ada')
  ada.location = GeoLocationNoFix.new(53.477, -2.236)

  grace = PersonNoFix.new('Grace')
  grace.location = GeoLocationNoFix.new(-33.89, 151.277)

  ada.teleport_to(-33.89, 151.277)

  assert_equal("(-33.89, 151.277)", ada.location.to_s)
  assert_equal("(-33.89, 151.277)", grace.location.to_s)
  refute(ada.location == grace.location)
end

def test_two
  # I was a bit confused at first as where to put the #== at first, however,
  # when calling add.location and grace.location a read for Person is being called
  # which returns a GeoLocation object, so the comparison needs to go in that class
  # remember unless modified through a custom definition, == compares object identity
  ada = Person.new('Ada')
  ada.location = GeoLocation.new(53.477, -2.236)

  grace = Person.new('Grace')
  grace.location = GeoLocation.new(-33.89, 151.277)

  ada.teleport_to(-33.89, 151.277)

  assert_equal("(-33.89, 151.277)", ada.location.to_s)
  assert_equal("(-33.89, 151.277)", grace.location.to_s)
  assert(ada.location == grace.location)
end

end