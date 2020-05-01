class BeerSong
  attr_accessor :verses

  def lyrics
    verse((0..99).to_a.reverse)
  end

  def verse(*verses)
    result = []
    verses.flatten.each do |num|
      if num > 2
        result << more_than_two(num)
      elsif num == 2
        result << two(num)
      elsif num == 1
        result << one(num)
      elsif num == 0
        result << zero(num)
      end
    end
    result.join("\n")
  end

  def verse_poly(*verses)
    result = []
    verses.flatten.each do |num|
      result << type.return_verse
    end
    result.join("\n")
  end


  def verses(to, from)
    verse((from..to).to_a.reverse)
  end

  private

  def type

  end

  def more_than_two(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end

  def two(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
  end

  def one(num)
    "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def zero(num)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

# p BeerSong.new.verse(99)
# p b1
