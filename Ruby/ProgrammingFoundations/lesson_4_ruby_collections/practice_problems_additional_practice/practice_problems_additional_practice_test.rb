require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class PracticeProblemsAdditionalPracticeTest < Minitest::Test

  def titlelize(str)
    str.gsub(/\b([[:alpha:]])(?=[[:alpha:]]+\b)/) { $1.upcase }
  end

  def setup
    @flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
    @ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
    @ages2 = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
    @numbers = [1, 2, 3, 4]
  end

  def test_1
    # Turn this array into a hash where the names are the keys and the values are the positions in the array.
    result = @flintstones.map.with_index {|name, idx| [name, idx]}.to_h
    expected = {"Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3,
      "Pebbles" => 4, "BamBam" => 5}
    assert_equal(expected, result)
  end

  def test_2
    # Add up all of the ages from the Munster family hash
    expected = 6174
    result = @ages.inject(0) {|sum, (name, age)| sum += age}
    assert_equal(expected, result)
    result2 = @ages.values.inject(:+) # this is the LS solution, much better!!
    assert_equal(expected, result2)
  end

  def test_3
    # throw out the really old people (age 100 or older)
    expected = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
    @ages2.delete_if {|name, age| age >= 100}
    assert_equal(expected, @ages2)
  end

  def test_4
    # Pick out the minimum age from our current Munster family hash
    expected = 10
    result = @ages.values.min
    assert_equal(expected, result)
  end

  def test_5
    # Find the index of the first name that starts with "Be"
    expected = 3
    result = @flintstones.find_index {|name| name.match?(/Be/)}
    assert_equal(expected, result)
  end

  def test_6
    # Amend this array so that the names are all shortened to just the first three characters:
    expected = %W(Fre Bar Wil Bet Peb Bam)
    result = @flintstones.map {|name| name[0..2]}
    assert_equal(expected, result)
  end

  def test_7
    # Create a hash that expresses the frequency with which each letter occurs in this string:
    statement = "The Flintstones Rock"
    letter_hsh = Hash.new(0)
    statement.split.each do |word|
      word.chars.each {|letter| letter_hsh[letter] += 1}
    end
    expected = {'T' => 1, 'h' => 1, 'e' => 2, "F" => 1, "l" => 1,
      "n" => 2, "t" => 2, "s" => 2, "o" => 2, "R" => 1, "c" => 1,
      "k" => 1, "i" => 1}
    assert_equal(expected, letter_hsh)
  end

  def test_8
    # the key point I learned in this exercise is that for each iteration Ruby recalculates
    # the size of the array.  So the first time through the array is [1, 2, 3, 4] and 1 is
    # output, but then a shift occurs and the array is now [2, 3, 4] and the array length is
    # now three.  Now the Array#each advances to index 1 so in the modified array numbers[1]
    # is 3 so this is now output.  Another shift occurs and the array is now [2, 4].  However,
    # the next iteration never takes place because 
    result = []
    expected = [3, 4]
    assert_output("1\n3\n") { result = @numbers.each {|number| puts number; @numbers.shift(1)} }
    assert_equal(expected, result)
  end

  def test_8a
=begin
  start at index 0
  [1, 2, 3, 4] puts 1; index now advances to 1
     [1, 2, 3] puts 2; index now advances to 2
     [1, 2] stops iterating because there is no index 2
=end
    result = []
    expected = [1, 2]
    assert_output("1\n2\n") { result = @numbers.each {|number| puts number; @numbers.pop(1)} }
    assert_equal(expected, result)
  end

  def test_8b
=begin
  start at index 0
 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] => [0, 0] index now advances to 1
    [1, 2, 3, 4, 5, 6, 7, 8, 9] => [2, 1] index now advances to 2
       [2, 3, 4, 5, 6, 7, 8, 9] => [4, 2] index now advances to 3
          [3, 4, 5, 6, 7, 8, 9] => [6, 3] index now advances to 4
             [4, 5, 6, 7, 8, 9] => [8, 4] index now advances to 5
                [5, 6, 7, 8, 9] => iteration stops array.size = 5, so last index is 4
=end
    arr = (0..9).to_a
    removed_items = []
    arr.each.with_index {|num, idx| removed_items.push([num, idx]); arr.shift}
    expected_removed_items = [[0, 0], [2, 1], [4, 2], [6, 3], [8, 4]]
    expected = [5, 6, 7, 8, 9]
    assert_equal(expected_removed_items, removed_items)
    assert_equal(expected, arr)
  end

  def test_9
    # Write your own version of the rails titleize implementation.
    words = "the flintstones rock"
    expected = "The Flintstones Rock"
    result = titlelize(words)
    assert_equal(expected, result)
  end

  def test_10
=begin
Modify the hash such that each member of the Munster family has an additional "age_group"
key that has one of three values describing the age group the family member is in (kid, adult, or senior).

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
=end
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }

    expected = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
      "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
      "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
      "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
      "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

      hsh = Hash["age_group", '']
      munsters.each {|key, value| value.merge!(hsh)}
  
      munsters.each do |key, value|
        value.each do |key, age|
          if key == "age"
            case age
            when (0..17) then value["age_group"] = "kid"
            when (18..64) then value["age_group"] = "adult"
            else value["age_group"] = "senior"  
            end
          end
        end
      end

      assert_equal(expected, munsters)  
  end

  def test_10a
    # LS solution much cleaner
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }

    expected = { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
      "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
      "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
      "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
      "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }

    munsters.each do |name, details|
      case details["age"]
      when (0..17) then details["age_group"] = "kid"
      when (18..64) then details["age_group"] = "adult"
      else details["age_group"] = "senior"
      end
    end

    assert_equal(expected, munsters)    
  end
  
end