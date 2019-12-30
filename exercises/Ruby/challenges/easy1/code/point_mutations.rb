class DNA

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    smaller, larger = sort_strands_by_length(distance).map(&:chars)
    smaller.each.with_index.inject(0) do |diff, (chr, idx)|
      (chr != larger[idx]) ? diff += 1 : diff
    end
  end

  private

  attr_reader :strand

  def sort_strands_by_length(distance)
    [strand, distance].sort_by { |str| str.length }
  end
end
