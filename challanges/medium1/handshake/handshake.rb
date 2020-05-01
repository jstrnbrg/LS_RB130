class SecretHandshake
  attr_accessor :bits

  COMMANDS = {
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump"
  }

  def initialize(x)
    @bits = to_binary(x)
  end

  def commands
    return [] if bits =~ /^[01]/
    commands = command_array()
    reverse_and_remove!(commands) if reverse?(commands)
    commands.reverse.map {|num| COMMANDS[num]}
  end

  private

  def reverse?(commands)
    commands.include?(10000)
  end

  def reverse_and_remove!(commands)
    commands.reverse!
    commands.delete(10000)
  end

  def command_array
    bits.to_s.chars.map.with_index do |bit, idx|
      (bit + "0"* (bits.to_s.size - idx - 1)).to_i
    end.reject {|x| x == 0}
  end

  def to_binary(x)
    x.is_a?(String) ? x.to_i : x.to_s(2).to_i
  end
end

# Alternatively
class SecretHandshake
  attr_reader :input

  def initialize(input)
    @input = to_binary(input)
  end

  def to_binary(obj)
    obj.is_a?(String) ? obj.to_i.to_s : obj.to_s(2)
  end

  def commands
    result = []
    result << 'wink' if input[-1] == '1'
    result << 'double blink' if input[-2] == '1'
    result << 'close your eyes' if input[-3] == '1'
    result << 'jump' if input[-4] == '1'
    result.reverse! if input[-5] == '1'
    result
  end
end
