require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise2Test < Minitest::Test

  def predict_weather_flawed
    sunshine = ['true', 'false'].sample
    prefix = "Today's weather will be "
    sunshine ? prefix << "sunny." : prefix << "cloudy."
  end

  def predict_weather_fixed
    sunshine = [true, false].sample
    prefix = "Today's weather will be "
    sunshine ? prefix << "sunny." : prefix << "cloudy."
  end

  def test_1
    # the method alwasy takes the true branch because #sample
    # returns a string which is always truthy in Ruby.
    arr = []
    expected = "Today's weather will be sunny."
    10.times do
      arr << predict_weather_flawed
    end
    assert(arr.all? { |str| str == expected })
  end

  def test_2
    arr = []
    expected = [
      "Today's weather will be sunny.",
      "Today's weather will be cloudy."
    ]
    10.times do
      arr << predict_weather_fixed
    end
    assert(arr.any? { |str| str == expected.first })
    assert(arr.any? { |str| str == expected.last })
  end

end
