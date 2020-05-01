class Scrabble
  SCORES = {
    1 => %w(A E I O U L N R S T),
    2 => %w(D G),
    3 => %w(B C M P),
    4 => %w(F H V W Y),
    5 => %w(K),
    8 => %w(J X),
    10 => %w(Q Z)
  }

  attr_accessor :word
  def initialize(w)
    @word = w
  end

  def self.score(w)
    self.new(w).score
  end

  def score
    return 0 unless word.is_a?(String) && word =~ /^[A-Za-z]/
    word.upcase.chars.reduce(0) do |acc, char|
      acc + SCORES.find {|_,v| v.include?(char)}.first
    end
  end
end
