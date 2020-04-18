# modify the Tree class to support the methods of Enumerable.
# You do not have to actually implement any methods -- just show the methods
# that you must provide.
class Tree
  include Enumerable

  def each
  end
end


# Write a method that takes an optional block. If the block is specified,
# the method should execute it, and return the value returned by the block.
# If no block is specified, the method should simply return the String
# 'Does not compute.'.
def compute
  return yield if block_given?
  'Does not compute.'
end

# p compute { 5 + 3 }  == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'


# Modify the compute method so it takes a single argument and yields that
#  argument to the block. Provide at least 3 examples of calling this new
#  version of compute, including a no-block call.

def compute_2(x)
  return yield(x) if block_given?
  'Does not compute.'
end

# p compute_2(2) {|x| x**2}
# p compute_2(3) {|x| x + 4}
# p compute_2(4) {|x| x % 2}



# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

def missing(arr)
  (arr[0]..arr[-1]).select do |x|
    !arr.include?(x)
  end
end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []


# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence
# you wish.

def divisors(x)
  divisors = 1.upto(x/2).select do  |divisor|
    x % divisor == 0
  end
  divisors << x
end

def divisors2(n)
  2.upto((n**0.5).to_i).with_object([1, n]) do |i, arr|
    arr << i << n / i if (n % i).zero?
  end.uniq.sort
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
#p divisors2(98) == [1, 2, 7, 14, 49, 98]
#p divisors2(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# Decrypt these strings using rot13

ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def decrypt(name)
  name.chars.map do |encrypted_char|
    case encrypted_char
    when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
    when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
    else                         encrypted_char
    end
  end.join
end

ENCRYPTED_PIONEERS.each do |encrypted|
  puts decrypt(encrypted)
end
