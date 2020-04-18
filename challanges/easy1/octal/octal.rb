class Octal
  attr_accessor :octal
  def initialize(n)
    @octal = n
  end

  def to_decimal
    return 0 if octal =~ /\D|[8-9]/ #octal.chars.any? {|digit| !"01234567".include?(digit)}
    sum = 0
    octal.chars.map(&:to_i).reverse.each_with_index do |digit, idx|
      sum += digit * 8 ** idx
    end
    sum
  end
end
