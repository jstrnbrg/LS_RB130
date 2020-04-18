class Trinary
  attr_accessor :trinary
  def initialize(n)
    @trinary = n
  end

  def to_decimal
    return 0 if trinary =~ /\D|[4-9]/
    trinary.chars.map(&:to_i).reverse.each_with_index.map do |digit, idx|
      digit * 3 ** idx
    end.reduce(:+)
  end
end
