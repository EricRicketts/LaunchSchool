# require 'minitest/autorun'
# require 'minitest/pride'
# require 'pry-byebug'

module MyModule
  def self.my_method(num)
    num ** 2
  end

  def MyModule.another_method(string)
    "#{string}"
  end
end

puts MyModule.my_method(4)
puts MyModule::another_method("foo bar")