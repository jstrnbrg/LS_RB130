# def reduce(arr, from = arr[0])
#   counter = 1
#   loop do
#     #p arr[counter]
#     break if counter == arr.size
#     from = yield(from, arr[counter])
#     counter += 1
#   end
#   from
# end


def reduce(array, default=array[0])
  counter = 1
  accumulator = default

  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end

  accumulator
end



array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
#p reduce(array) { |acc, num| acc + num if num.odd? }
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
