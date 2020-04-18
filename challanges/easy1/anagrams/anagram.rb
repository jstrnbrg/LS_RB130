class Anagram
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def match(options)
    options.select do |option|
      next if option.downcase == word.downcase
      option.downcase.chars.sort == word.downcase.chars.sort
    end
  end
end
