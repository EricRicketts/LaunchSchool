class Triplet
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def product
    a * b * c
  end

  def pythagorean?
    a.pow(2) + b.pow(2) == c.pow(2)
  end

  def sum
    a + b + c
  end
end