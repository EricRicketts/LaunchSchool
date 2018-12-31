require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise2Test < Minitest::Test
  attr_accessor :my_proc, :my_second_proc, :my_lambda, :my_second_lambda

  def block_method_1(animal)
    yield
  end

  def block_method_2(animal)
    yield(animal)
  end

  def setup
    @my_proc = proc { |thing| "This is a #{thing}." }
    @my_second_proc = Proc.new { |thing| "This is a #{thing}." }
    @my_lambda = lambda { |thing| "This is a #{thing}." }
    @my_second_lambda = -> (thing) { "This is a #{thing}." }
  end

  def test_proc
    assert(Proc, my_proc.class)
    assert_equal("This is a .", my_proc.call)
    assert_equal(1, my_proc.arity)
    assert_equal("This is a cat.", my_proc.call("cat"))
  end

  def test_second_proc
    assert(Proc, my_second_proc.class)
    assert_equal("This is a .", my_second_proc.call)
    assert_equal(1, my_second_proc.arity)
    assert_equal("This is a cat.", my_second_proc.call("cat"))
  end

  def test_lambda
    assert(Proc, my_lambda.class)
    assert_raises(ArgumentError) { my_lambda.call }
    assert_equal(1, my_lambda.arity)
    assert_equal("This is a cat.", my_proc.call("cat"))
  end

  def test_second_lambda
    assert(Proc, my_second_lambda.class)
    assert_raises(ArgumentError) { my_second_lambda.call }
    assert_equal(1, my_second_lambda.arity)
    assert_equal("This is a cat.", my_second_lambda.call("cat"))
  end

  def test_first_block_method
    result = block_method_1('seal') { |seal| "This is a #{seal}." }
    assert_equal("This is a .", result)
    assert_raises(LocalJumpError) { block_method_1('seal') }
  end

  def test_second_block_method
    result = block_method_2('turtle') { |turtle| "This is a #{turtle}." }
    assert_equal("This is a turtle.", result)
    result = block_method_2('turtle') do |turtle, seal|
      "This is a #{turtle} and a #{seal}."
    end
    assert_equal("This is a turtle and a .", result)
    assert_raises(NameError) { block_method_2('turtle') { "This is a #{animal}." }}
  end
end