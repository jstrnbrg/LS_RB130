# https://launchschool.com/exercises/b3d4e236

class Luhn
  attr_accessor :num

  def self.create(n)
    (0..9).each do |x|
      num = (n.to_s + x.to_s).to_i
      return num if Luhn.new(num).valid?
    end
  end

  def initialize(n)
    @num = n
  end

  def addends
    double_and_subtract.digits.reverse
  end

  def checksum
    calculate_checksum(double_and_subtract)
  end

  def valid?
    checksum % 10 == 0
  end

  private

  def calculate_checksum(num)
    num.digits.sum
  end

  def double_and_subtract
    num.digits.each.with_index.with_object([]) do |(_, idx), result|
      idx.even? ? result << num.digits[idx] : result << new_digit(num.digits[idx])
    end.reverse.join.to_i
  end

  def new_digit(old_digit)
    old_digit * 2 >= 10 ? old_digit * 2 - 9 : old_digit * 2
  end
end
