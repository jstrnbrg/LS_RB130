class Sieve
  attr_accessor :cap, :range
  def initialize(n)
    @cap = n
    @range = (2..n).to_a
  end

  def primes
    primes = range.dup
    2.upto(cap) do |value|
      (2..cap ** 0.5).each do |multiplier|
        number = value * multiplier
        break if number > cap
        primes.delete(number) if primes.include?(number)
      end
    end
    primes
  end
end
