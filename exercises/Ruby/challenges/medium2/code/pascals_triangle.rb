class Triangle
  attr_reader :rows

  def initialize(row_limit)
    @rows = make_pascal_triangle(row_limit)
  end

  private

  def make_pascal_triangle(row_limit)
    (1..row_limit).each.with_index.inject([]) do |triangle, (row_number, idx)|
      triangle << Array.new(row_number) do |i|
        edge_number?(row_number, i) ? 1 : nonedge_number(triangle, idx, i)
      end
    end
  end

  def edge_number?(row_number, i)
    i.zero? || i == (row_number - 1)
  end

  def nonedge_number(triangle, idx, i)
    triangle[idx - 1].slice((i - 1), 2).sum
  end
end
