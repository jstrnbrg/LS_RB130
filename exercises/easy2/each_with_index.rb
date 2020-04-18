=begin
Write a method called each_with_index that behaves similarly for Arrays.
t should take an Array as an argument, and a block. It should yield each
element and an index number to the block. each_with_index should return a
reference to the original Array.

Your method may use #each, #each_with_object, #inject, loop, for, while, or
until to iterate through the Array passed in as an argument, but must not use
any other methods that iterate through an Array or any other collection.
=end

def each_with_index(arr)
  index = 0
  arr.each do |item|
    yield(item, index)
    index +=1
  end
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
