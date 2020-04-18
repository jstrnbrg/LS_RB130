def each(arr)
  counter = 0
  loop do
    break if counter == arr.size
    yield(arr[counter])
    counter += 1
  end
  arr
end

p each([1,2,3,4,5]) {|x| p x}
