
# First try:
# class CircularBuffer
#   attr_accessor :buffer, :size, :item_count
#
#   def initialize(size)
#     @size = size
#     @buffer = []
#     @item_count = 0
#   end
#
#   def read
#     raise BufferEmptyException if buffer.empty? #{|i| i == nil}
#     buffer.delete(get_oldest_element).value
#   end
#
#   def write(v)
#     normal_write(v)
#   end
#
#   def write!(v)
#     forced_wrote(v)
#   end
#
#
#   def clear
#     self.buffer = []
#   end
#
#   class BufferEmptyException < StandardError
#   end
#
#   class BufferFullException < StandardError
#   end
#
#   private
#
#   def buffer_full?
#     buffer.size >= size
#   end
#
#   def get_oldest_element
#     buffer.min_by {|item| item.id}
#   end
#
#   def normal_write(v)
#     return if v == nil
#     item = Item.new(v, item_count)
#     if buffer_full?
#       raise BufferFullException
#     else
#       buffer.push(item)
#     end
#     self.item_count += 1
#   end
#
#   def forced_wrote(v)
#     return if v == nil
#     item = Item.new(v, item_count)
#     if buffer_full?
#       idx = buffer.index(get_oldest_element)
#       buffer[idx] = item
#     else
#       buffer.push(item)
#     end
#     self.item_count += 1
#   end
# end
#
# class Item
#   attr_accessor :id, :value
#
#   def initialize(v, id)
#     @value = v
#     @id = id
#   end
# end

# Second try
class CircularBuffer
  attr_accessor :buffer, :size

  def initialize(size)
    @size = size
    @buffer = []
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(v)
    update_buffer(v) { raise BufferFullException }
  end

  def write!(v)
    update_buffer(v) { buffer.shift }
  end


  def clear
    self.buffer = []
  end

  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  private

  def buffer_full?
    buffer.size >= size
  end

  def get_oldest_element
    buffer.min_by {|item| item.id}
  end

  def update_buffer(v)
    return if v.nil?
    yield if buffer_full?
    buffer << v
  end
end
