class Clock
  attr_accessor :min

  def self.at(h, m = 0)
    clock = Clock.new(h, m)
  end

  def initialize(h, m)
    @min = (h * 60 + m)
  end

  def +(minutes)
    self.min += minutes
    wrap_positive! if self.min >= 1440
    self
  end

  def -(minutes)
    self.min -= minutes
    wrap_negative! if self.min <= 0
    self
  end

  def ==(other)
    self.min == other.min
  end

  def to_s
    h, m = min.divmod(60)
    "%02d:%02d" % [h, m]
  end

  private

  def wrap_positive!
    self.min -= 1440
  end

  def wrap_negative!
    self.min += 1440
  end
end
