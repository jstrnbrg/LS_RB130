class InvalidCodonError < StandardError
end

class Translation
  CODONS = {
    "Methionine": %w(AUG),
    "Phenylalanine": %w(UUU UUC),
    "Leucine": %w(UUA UUG),
    "Serine": %w(UCU UCC UCA UCG),
    "Tyrosine": %w(UAU UAC),
    "Cysteine": %w(UGU UGC),
    "Tryptophan": %w(UGG),
    "STOP": %w(UAA UAG UGA)
  }

  def self.of_codon(codon)
    codon = CODONS.find {|_,v| v.include?(codon)}
    raise InvalidCodonError if codon == nil
    codon.first.to_s
  end

  def self.of_rna(rna)
    rna.scan(/.{3}/).each_with_object([]) do |codon, sequence|
      return sequence if of_codon(codon) == "STOP"
      sequence << of_codon(codon)
    end
  end
end
