=begin
- Rule 1: word begins with vowel: append "ay"
- Rule 2: word begins with consonant: move consonant to end and append "ay"
- Rule 3: some random other rules
=end

class PigLatin
  def self.translate(sentence)
    words = sentence.split
    words.map do |word|
      if word.chars.first.downcase =~ /[aeiuo]/
        vowel_first(word)
      elsif word.start_with?("xr")
        word + "ay"
      elsif word.start_with?("yt")
        word + "ay"
      elsif word.include?("qu")
        idx = word.chars.find_index("u")
        move_n_letters(word, idx)
      else
        consonants_first(word)
      end
    end.join(" ")
  end

  private

  def self.vowel_first(w)
    w + "ay"
  end

  def self.constants_index(w)
    consonant_vowel = w.downcase.chars.map {|c| !!(c=~ /[^aeiuo]/)}
    consonant_vowel.find_index(false) - 1
  end

  def self.move_n_letters(w, n)
    word_arr = w.chars
    first = word_arr[0..n].join
    second = word_arr[n +1 ..-1].join
    second + first + "ay"
  end

  def self.consonants_first(w)
    idx = constants_index(w)
    move_n_letters(w, idx)
  end
end

p PigLatin.translate("yttria")
