class InvalidCodonError < StandardError; end

class Translation
  CODON_HASH = {
    %w(AUG) => "Methionine",
    %w(UUU UUC) => "Phenylalanine",
    %w(UUA UUG) => "Leucine",
    %w(UCU UCC UCA UCG) => "Serine",
    %w(UAU UAC) => "Tyrosine",
    %w(UGU UGC) => "Cysteine",
    %w(UGG) => "Tryptophan",
    %w(UAA UAG UGA) => "STOP"
  }

  def self.of_codon(codon)
    codon_key = CODON_HASH.keys.find { |key| key.include?(codon) }
    CODON_HASH[codon_key].nil? ? raise(InvalidCodonError) : CODON_HASH[codon_key]
  end

  def self.of_rna(strand)
    strand.scan(/[[:alpha:]]{3}/).map do |codon|
      self.of_codon(codon)
    end.take_while do |protein|
      protein != 'STOP'
    end
  end
end
