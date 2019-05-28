class Triangle
  attr_reader :rows

  def initialize(row_limit)
    rows = make_pascal_triangle(row_limit)
  end

  private

  def make_pascal_triangle(row_limit)
    (1..row_limit).each.with_index.inject([]) do |triangle, (row_number, idx)|
      row = Array.new(row_number) do |i|
        i.zero? || i == (row_number - 1) ? 1 : 0
        if row_number > 2 && !(i.zero? || i == row_number - 1)
          triangle[row_number - 1][(i - 1)..i].sum
        end
      end
      triangle << row
    end
  end
end

=begin
[28] pry(main)> (1..2).each.with_index.inject([]) do |memo, (n, idx)|
[28] pry(main)*   a = Array.new(n) do |i|
[28] pry(main)*     i.zero? || i == (n-1) ? 1 : 0
[28] pry(main)*   end
[28] pry(main)*   memo << a
[28] pry(main)* end
=end
