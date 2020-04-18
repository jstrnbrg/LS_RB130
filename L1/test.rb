def method(&block) #method takes explicit block and turns it into a proc if necessary
  puts "method has been called"
  puts block
  method2(&block) if block_given? # if block is given, pass proc object into method2
end

def method2(&block)
  puts "method2 has been called"
  puts block
  block.call #execute proc object
end



block = Proc.new {puts "proc created manually"} # create a proc object
method(&block)

puts "---"

method {puts "just a block"}
