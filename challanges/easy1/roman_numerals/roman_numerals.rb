class Integer
  ROMAN_NUMERALS =
  {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  } #relies on the fact that in newer ruby versions a hash stays sorted

  def to_roman
    roman_numeral = ''
    remaining = self

    while remaining > 0
      ROMAN_NUMERALS.keys.each do |key|
        next if remaining < key
        multiplier, remaining = remaining.divmod(key)
        roman_numeral << ROMAN_NUMERALS[key] * multiplier
      end
    end
    roman_numeral
  end
end
