def times(n)
  counter = 0
  loop do
    break if counter == n
    yield(counter)
    counter += 1
  end
  n
end


returned =  times(5) do |num|
  puts num
end

p returned
