class BeerSong
  ALL = 99
  THREE = 3
  TWO = 2
  ONE = 1
  NONE = 0

  def lyrics
    verses(ALL, NONE)
  end

  def verse(n)
    case n
    when (THREE..ALL) then more_than_two(n)
    when TWO then two
    when ONE then one
    else no_more
    end
  end

  def verses(*bottles)
    (bottles.max).downto(bottles.min).map { |n| verse(n) }.join("\n")
  end

  private

  def more_than_two(n)
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" +
    "Take one down and pass it around, #{n-1} bottles of beer on the wall.\n"
  end

  def no_more
    "No more bottles of beer on the wall, no more bottles of beer.\n" +
    "Go to the store and buy some more, #{ALL} bottles of beer on the wall.\n"
  end

  def one
    "#{ONE} bottle of beer on the wall, #{ONE} bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def two
    "#{TWO} bottles of beer on the wall, #{TWO} bottles of beer.\n" +
    "Take one down and pass it around, #{ONE} bottle of beer on the wall.\n"
  end
end