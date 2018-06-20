require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class FirstExercise < Minitest::Test

  def madlibs
    hsh = Hash.new
    lines = IO.readlines("input.txt", chomp: true) 
    lines.each do |str|
      key, value = str.split(":")
      key = key.to_sym
      case key
      when :noun
        hsh[:noun].nil? ? hsh[:noun] = [value] : hsh[:noun] << value
      when :verb
        hsh[:verb].nil? ? hsh[:verb] = [value] : hsh[:verb] << value
      when :adjective
        hsh[:adjective].nil? ? hsh[:adjective] = [value] : hsh[:adjective] << value
      when :adverb
        hsh[:adverb].nil? ? hsh[:adverb] = [value] : hsh[:adverb] << value
      end
    end
    puts "The sleepy #{hsh[:adjective].first} #{hsh[:noun].first} #{hsh[:adverb].first}"
    puts "#{hsh[:verb].first} the sleepy #{hsh[:adjective].last}"
    puts "#{hsh[:noun].last}, who #{hsh[:adverb].last} #{hsh[:verb].last} his"
    puts "tail and looks around."
  end

  def test_1
    output = "The sleepy brown cat noisily\nlicks the sleepy yellow\n" + 
    "dog, who lazily licks his\ntail and looks around.\n"
    assert_output(output) { madlibs }
  end
  
end