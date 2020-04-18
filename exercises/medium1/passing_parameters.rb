# Modify the method below so that the display/output of items is moved to a
#block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

# gather(items) {|items| puts items.join('; ')}
#
#
# gather(items) do |produce|
#   puts "We've gathered some vegetables: #{produce[1]} and #{produce[2]}"
# end


birds = %w(raven finch hawk eagle)

def types(arr)
  yield(arr)
end

# types(birds) do |_, _, *raptors|
#   puts "Raptors: #{raptors.join(', ')}."
# end


items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do | *first_second_third, fourth |
  puts first_second_third.join(", ")
  puts fourth
end

gather(items) do | first, *second_third, fourth |
  puts first
  puts second_third.join(", ")
  puts fourth
end

gather(items) do | first, *rest |
  puts first
  puts rest.join(", ")
end

gather(items) do | first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, and #{fourth}"
end
