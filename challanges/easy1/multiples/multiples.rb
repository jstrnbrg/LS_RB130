class SumOfMultiples
  attr_accessor :cap, :multipliers

  def initialize(*multipliers)
    @multipliers = multipliers
  end

  def to(n)
    self.class.to(n, multipliers)
  end

  def self.to(cap, multipliers = [3,5])
    multipliers.each_with_object([]) do |multiplier, array|
      (0..cap).each do |number|
        multiplier * number >= cap ? break : array << multiplier * number
      end
    end.uniq.reduce(0, :+) #default 0 if array is empty
  end
end
