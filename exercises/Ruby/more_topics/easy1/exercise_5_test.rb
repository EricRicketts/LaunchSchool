require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise5Test < Minitest::Test
  NUMBER_OF_LETTERS = 26
  ROT13_SHIFT_VALUE = 13
  ORD_OF_A = 97
  ORD_OF_Z = 122
  attr_accessor :input, :output, :output_file_name, :expected

  def decrypt_rot13(name)
    name.downcase.gsub(/[[:alpha:]]/) do |match|
      shifted_ord = match.ord + ROT13_SHIFT_VALUE
      shifted_normalized_ord = shifted_ord - NUMBER_OF_LETTERS
      shifted_ord > ORD_OF_Z ? shifted_normalized_ord.chr : shifted_ord.chr
    end.split.map(&:capitalize).join(" ")
  end

  def setup
    @input = File.read('exercise_5_input.txt')
    @output_file_name = 'exercise_5_output.txt'
    @output = File.new(output_file_name, 'w+')
    @expected = <<-OUTPUT.gsub(/^\s+/, '')
    Ada Lovelace
    Grace Hopper
    Adele Goldstine
    Alan Turing
    Charles Babbage
    Abdullah Muhammad Bin Musa Al-khwarizmi
    John Atanasoff
    Lois Haibt
    Claude Shannon
    Steve Jobs
    Bill Gates
    Tim Berners-lee
    Steve Wozniak
    Konrad Zuse
    Sir Antony Hoare
    Marvin Minsky
    Yukihiro Matsumoto
    Hayyim Slonimski
    Gertrude Blanch
    OUTPUT
  end

  def teardown
    File.delete(output_file_name)
  end

  def test_rot13_encrypt
    input.each_line do |line|
      output.write(decrypt_rot13(line).concat("\n"))
    end
    output.close
    assert_equal(expected, File.read(output_file_name))
  end
end
