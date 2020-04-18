class DNA
  attr_accessor :sequence

  def initialize(s)
    @sequence = s
  end

  def hamming_distance(compare_sequence)
    count = 0
    sequence.chars.each_with_index do |nucleotide, idx|
      break if idx >= [compare_sequence.size, sequence.size].min
      compare_sequence[idx] == nucleotide ? next : count += 1
    end
    count
  end
end
