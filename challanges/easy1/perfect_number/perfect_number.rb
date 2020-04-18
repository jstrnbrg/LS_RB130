class PerfectNumber
  def self.classify(n)
    raise RuntimeError if n < 0
    evaluate(n)
  end

  private

  def self.evaluate(n)
    sum_of_divisors = get_divisors_sum(n)
    case
      when sum_of_divisors < n then 'deficient'
      when sum_of_divisors > n then 'abundant'
      when sum_of_divisors == n then 'perfect'
    end
  end

  def self.get_divisors_sum(n)
    (1...n).select {|i| n % i == 0}.sum
    # 1.upto(n-1).each.each_with_object([]) do |num, arr|
    #   arr << num if n % num == 0
    # end.sum
  end
end
