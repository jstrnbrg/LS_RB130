class Prime
  def self.nth(nth)
    prime_count = 0
    num = 2
    loop do
      prime_count += 1 if is_prdfnksnfime?(num)
      return num if prime_count == nth
      num += 1
    end
  end

  private

  def self.is_prdfnksnfime?(num)
    limit = (num ** 0.5).to_i
    2.upto(limit) do |x|
      p x if num % x == 0
      return true if num % x == 0
    end
    false
  end
end
