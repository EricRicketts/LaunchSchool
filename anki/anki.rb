# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry-byebug'

=begin
1.  write a textual description of the problem.
2.  extract the major nouns and verbs from the textual description
3.  Organize by associating the verbs with the nouns
4.  The nouns are the classes and the verbs the methods.
=end

class Dog

  def self.foo
    "foo"
  end

  private

  def self.dream
    puts "I am flying!"
  end

  # public

  # def i_method
  #   self.class.dream
  # end

  # def self.sleep # 2
  #   dream
  # end

  # def self.another_call
  #   sleep
  # end

  # self.dream # 1
end

# Dog.another_call
# Dog.new.i_method
class Pet < Dog; end

Pet.dream
