class Clock
  HOURS = 24
  MINUTES = 60

  def self.at(hrs=0, mins=0)
    Clock.new(hrs, mins)
  end

  def initialize(hrs, mins)
    total_hours = hrs + mins.divmod(MINUTES).first
    @hr = total_hours.modulo(HOURS)
    @min = mins.modulo(MINUTES)
  end

  def +(mins)
    Clock.new(hr, mins + min)
  end

  def -(mins)
    Clock.new(hr, min - mins)
  end

  def ==(other)
    self.hr == other.hr && self.min == other.min
  end

  def to_s
    sprintf("%02d:%02d", hr, min)
  end

  protected

  attr_accessor :hr, :min
end
