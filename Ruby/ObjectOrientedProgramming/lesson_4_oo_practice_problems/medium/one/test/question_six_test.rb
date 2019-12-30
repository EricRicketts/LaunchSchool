require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end
and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

What is the difference in the way the code works?
=end

class QuestionSixTest < Minitest::Test
  class Computer1
    attr_accessor :template

    def create_template
      @template = "template 14231"
    end

    def show_template
      template
    end
  end

  class Computer2
    attr_accessor :template

    def create_template
      self.template = "template 14231"
    end

    def show_template
      self.template
    end
  end

  attr_accessor :computer1, :computer2

  def setup
    @computer1 = Computer1.new
    @computer2 = Computer2.new
  end

  # I did not quite understand the author's question, I thought the
  # question really meant, "expalin the diffference in the implementations"
  # actually there is no difference in the way the code works, just in
  # the implementation decisions.

  def test_1
    # this code sets @template variable directly Computer1#create_template
    # and implicitly calls the getter method in Computer1#show_template
    computer1.create_template
    assert_equal("template 14231", computer1.show_template)
  end

  def test_2
    # in this implementation, both the getter and setter methods are
    # explicitly called.
    computer2.create_template
    assert_equal("template 14231", computer2.show_template)
  end

end
