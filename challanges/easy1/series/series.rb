# #first implementation
# class Series
#   attr_accessor :series
#
#   def initialize(series)
#     @series = series.split("").map(&:to_i)
#   end
#
#   def slices(window_size)
#     raise ArgumentError if window_size > series.length
#     result = []
#     series.each_with_index do |_, idx|
#       break if (idx + window_size) > series.size
#       result << series[idx..(idx + window_size - 1)]
#     end
#     result
#   end
# end
#
# # refactorred
# class Series
#   attr_accessor :series
#
#   def initialize(series)
#     @series = series.split("").map(&:to_i)
#   end
#
#   def slices(window_size)
#     raise ArgumentError if window_size > series.length
#     result = []
#     series.each_cons(window_size) {|sub_arr| result << sub_arr}
#     result
#   end
# end

# refactorred again
class Series
  attr_accessor :series

  def initialize(series)
    @series = series.chars.map(&:to_i)
  end

  def slices(window_size)
    raise ArgumentError if window_size > series.length
    series.each_cons(window_size).to_a
  end
end
