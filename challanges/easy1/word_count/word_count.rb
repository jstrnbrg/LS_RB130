class Phrase
  attr_accessor :phrase
  def initialize(p)
    @phrase = p
  end

  def word_count
    result = {}
    phrase.downcase.scan(/\b[\w']+\b/) do |word|
      result.keys.include?(word) ? result[word] += 1 : result[word] = 1
    end
    result
  end
end
