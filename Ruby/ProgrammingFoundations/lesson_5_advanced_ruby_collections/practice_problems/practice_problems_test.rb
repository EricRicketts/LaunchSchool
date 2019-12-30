require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class PracticeProblemsTest < Minitest::Test

  def generate_uuid
    str_ary = ('a'..'f').to_a + ('0'..'9').to_a
    last_idx = str_ary.size - 1
    indices = (0..last_idx).to_a
    sizes = [8, 4, 4, 4, 12]
    uuid = []
    sizes.each do |size|
      str = ''
      size.times do
        str << str_ary[indices.sample]
      end
      uuid.push(str)
    end
    uuid.join("-")
  end

  def test_1
    arr = ['10', '11', '9', '7', '8']
    expected = ['11', '10', '9', '8', '7']
    result = arr.sort {|a, b| b.to_i <=> a.to_i}
    assert_equal(expected, result)
  end

  def test_2
    books = [
      {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
      {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
      {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
      {title: 'Ulysses', author: 'James Joyce', published: '1922'}
    ]
    expected = [
      {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
      {title: 'Ulysses', author: 'James Joyce', published: '1922'},
      {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
      {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'}    
    ]
    result = books.sort_by {|hsh| hsh[:published].to_i}
    assert_equal(expected, result)
  end

  def test_3
    arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
    arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
    arr3 = [['abc'], ['def'], {third: ['ghi']}]
    hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
    hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
    expected = Array.new(5, 'g')
    r1 = arr1[2][1][3]
    r2 = arr2[1][:third][0]
    r3 = arr3[2][:third][0][0]
    r4 = hsh1['b'][1]
    r5 = hsh2[:third].keys[0]
    result = [r1, r2, r3, r4, r5]
    assert_equal(expected, result)
  end

  def test_4
    arr1 = [1, [2, 3], 4]
    arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
    hsh1 = {first: [1, 2, [3]]}
    hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

    ex1 = [1, [2, 4], 4]
    ex2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 4]
    ex3 = {first: [1, 2, [4]]}
    ex4 = {['a'] => {a: ['1', :two, 4], b: 4}, 'b' => 5} 

    expected = [ex1, ex2, ex3, ex4]

    arr1[1][1] = 4 
    arr2[2] = 4
    hsh1[:first][2][0] = 4
    hsh2[['a']][:a][2] = 4

    result = [arr1, arr2, hsh1, hsh2]
    assert_equal(expected, result)  
  end

  def test_5
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }

    result = munsters.select do |name|
      munsters[name]["gender"] == "male"
    end.inject(0) do |sum, arr|
      sum += munsters[arr.first]["age"]
    end

    assert_equal(444, result)    
  end
  
  def test_5a
    # LS solution much cleaner.  Did not know about Hash#each_value 
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }

    sum_of_male_ages = 0
    munsters.each_value do |details|
      sum_of_male_ages += details["age"] if details["gender"] == "male"
    end

    assert_equal(444, sum_of_male_ages)    
  end

  def test_6
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }
    expected = [
      "Herman is a 32-year-old male.", "Lily is a 30-year-old female.",
      "Grandpa is a 402-year-old male.", "Eddie is a 10-year-old male.",
      "Marilyn is a 23-year-old female."
    ] 

    result = munsters.map {|name, details| "#{name} is a #{details["age"]}-year-old #{details["gender"]}."}
    assert_equal(expected, result)   
  end

  def test_7
    a = 2
    b = [5, 8]
    arr = [a, b]

    arr[0] += 2
    arr[1][0] -= a 
    # a was never modified, there was a reassignment, intially
    # we have arr[0].object_id == a.object_id but after the reassignment
    # in line 128, a new object is created to occupy the first position
    # of the array.  However, in the case of b, b is an array and we
    # are changing one of the elements of the array, so b does get upated.
    assert(a == 2 && b == [3, 8])   
  end

  def test_8
    hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
    expected = [['e'], ['u', 'i'], ['o'], ['o'], ['u', 'e'], ['o', 'e'], ['e'], ['a'], ['o']]
    result = []
    hsh.each do |key, value|
      value.each do |word|
        result << word.scan(/[aeiou]/i)
      end
    end
    assert_equal(expected, result)
  end

  def test_9
    arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
    expected = [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
    result = arr.map { |ary| ary.sort.reverse }
    assert_equal(expected, result)
  end

  def test_9a
    # this is the LS solution this is what I originally tried to do
    arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
    expected = [['c', 'b', 'a'], [3, 2, 1], ['green', 'blue', 'black']]
    result = arr.map { |ary| ary.sort { |a, b| b <=> a } }
    assert_equal(expected, result)
  end

  def test_10
    arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
    expected = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]
    result = arr.map do |hsh|
      hsh.map do |key, value|
        [key, value + 1]
      end.to_h
    end
    assert_equal(expected, result)
    assert_equal([{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}], arr)
  end

  def test_10a
    # in order to leave the original hash untouched you have to
    # start with an empty hash, this is the LS solution
    arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
    expected = [{a: 2}, {b: 3, c: 4}, {d: 5, e: 6, f: 7}]    
    result = arr.map do |hsh|
      incremented_hsh = {}
      hsh.each do |key, value|
        incremented_hsh[key] = value + 1  
      end
      incremented_hsh
    end
    assert_equal(expected, result)    
  end

  def test_11
    arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
    expected = [[], [3], [9], [15]]
    result = arr.map do |sub_arr|
      sub_arr.select {|num| (num % 3).zero?}
    end

    assert_equal(expected, result)
  end

  def test_12
    arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
    expected = { a: 1, 'b' => 'two', 'sea' => {c: 3}, {a: 1, b: 2, c: 3, d: 4} => 'D'}
    hsh = {}
    arr.each do |sub_ary|
      hsh[sub_ary.first] = sub_ary.last
    end
    assert_equal(expected, hsh) 
  end

  def test_13
    arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
    expected = [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
    result = arr.sort_by do |sub_ary|
      sub_ary.select(&:odd?)
    end
    assert_equal(expected, result)
  end

  def test_14
    hsh = {
      'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
      'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
      'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
      'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
      'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
    }
    expected = [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
    result = hsh.each_value.map do |details|
      details[:type] == 'fruit' ? details[:colors].map(&:capitalize) : details[:size].upcase
    end
    assert_equal(expected, result)
  end

  def test_15
    arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
    expected = [{e: [8], f: [6, 10]}]
    result = arr.select do |hsh|
      hsh.values.flatten.all?(&:even?)
    end
    assert_equal(expected, result)
  end

  def test_16
    uuid = generate_uuid
    segments = uuid.split("-") 
    assert(segments.all? {|str| str.chars.all? {|char| char.match?(/[[:xdigit:]]/) }})
  end

end