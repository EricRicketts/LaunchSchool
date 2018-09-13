require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem statement

How do you find where Ruby will look for a method when that method is called?
How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

What is the lookup chain for Orange and HotSauce?
=end

module Taste
  def flavor(flavor)
    "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

class QuestionThreeTest < Minitest::Test

  # call ancestors on the class and you will get the lookup chain, I had
  # to eliminate two classes because they were added due to this Minitest
  # environment.
  def test_1
    expected = [Orange, Taste, Object, Kernel, BasicObject]
    results = Orange.ancestors.reject { |cls| cls == PP::ObjectMixin || cls == Minitest::Expectations }
    assert_equal(expected, results)
  end

  def test_2
    expected = [HotSauce, Taste, Object, Kernel, BasicObject]
    results = HotSauce.ancestors.reject { |cls| cls == PP::ObjectMixin || cls == Minitest::Expectations }
    assert_equal(expected, results)
  end
end