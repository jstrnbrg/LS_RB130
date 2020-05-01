class PhoneNumber
  attr_accessor :num_str

  def initialize(s)
    @num_str = s
  end

  def number
    digits = num_str.split("").select {|x| x =~ /[0-9]/}
    return '0000000000' if num_str =~ /[a-zA-Z]/
    return '0000000000' if invalid?(digits)
    return digits.join if digits.size == 10
    return digits[1..-1].join if digits.size == 11
  end

  def area_code
    number[0..2]
  end

  def to_s
    number.gsub(/^(\d{3})(\d+)(\d{4})$/, '(\1) \2-\3')
  end

  private

  def invalid?(dig_arr)
    dig_arr.size < 10 || dig_arr.size > 11 || (dig_arr.length == 11 && dig_arr[0] != '1')
  end
end
