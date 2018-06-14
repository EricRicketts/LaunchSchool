require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Now I Know My ABCs
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

AL:
  - create a hash where key, value are the 2 block letters
  - create an empty hash which will contain the used letters
  - for each letter check if it is a member of the used hash if so exit with false
    - if no exit then use the letter to select the key, value pair from the constant hash
  - return true if the loop does not exit
=end

class SecondExercise < Minitest::Test

  BLOCK_HASH = "B:O   X:K   D:Q   C:P   N:A G:T   R:E   F:S   J:W   H:U V:I   L:Y   Z:M".split.map {|block| block.split(":")}.to_h

  def block_word?(str)
    used = {}
    str.upcase.chars.each do |char|
      return false if (used.has_key?(char) || used.has_value?(char))
      if BLOCK_HASH.has_key?(char)
        used[char] = BLOCK_HASH[char]
      else
        used[BLOCK_HASH.key(char)] = char
      end 
    end
    true  
  end

  def test_0
    # skip
    assert(block_word?('BATCH'))
  end
  
  def test_1
    # skip
    refute(block_word?('BUTCH'))
  end
  
  def test_2
    # skip
    assert(block_word?('jest'))
  end
  
end

class SecondExerciseAnotherTry < Minitest::Test

  BLOCK_ARRAY = "B:O   X:K   D:Q   C:P   N:A G:T   R:E   F:S   J:W   H:U V:I   L:Y   Z:M".split.map {|block| block.split(":")}

  def block_word?(str)
    used = str.upcase.chars.map { |char| BLOCK_ARRAY.select {|block| block.include?(char)}.flatten }
    used == used.uniq
  end

  def test_0
    # skip
    assert(block_word?('BATCH'))
  end
  
  def test_1
    # skip
    refute(block_word?('BUTCH'))
  end
  
  def test_2
    # skip
    assert(block_word?('jest'))
  end
  
end

class SecondExerciseLS < Minitest::Test

=begin
I forgot how String#count works.  It counts the total
occurences of each letter in the substring for the string
it is called on.  For example:

a = "hello world"
a.count "lo" #=> 5 3 "l" and 2 "o"

=end


  BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

  def block_word?(string)
    up_string = string.upcase
    BLOCKS.none? { |block| up_string.count(block) >= 2 }
  end

  def test_0
    # skip
    assert(block_word?('BATCH'))
  end
  
  def test_1
    # skip
    refute(block_word?('BUTCH'))
  end
  
  def test_2
    # skip
    assert(block_word?('jest'))
  end
  
end