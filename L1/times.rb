def times(n)
  (0...n).each do |x|
    yield(x)
  end
  n
end

returned = times(5) {|n| puts n}
puts returned
