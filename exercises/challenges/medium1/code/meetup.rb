require 'pry-byebug'
require 'date'
class Meetup
  TEENTH_DAYS = (13..19).to_a
  ARRAY_LITERAL = "[]"
  SELECTION = {
    teenth: TEENTH_DAYS,
    first: [ARRAY_LITERAL, 0],
    second: [ARRAY_LITERAL, 1],
    third: [ARRAY_LITERAL, 2],
    fourth: [ARRAY_LITERAL, 3],
    last: [:last]
  }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, location_in_month)
    sel = SELECTION.keys.select { |locator| locator == location_in_month }.first
    sel == :teenth ? mtg_on_teenth(weekday) : mtg_on(weekday, location_in_month)
  end

  private

  attr_reader :month, :year

  def mtg_on(weekday, location_in_month)
    occurrence = SELECTION[location_in_month]
    Date.new(year, month).step(Date.new(year, month, -1)).select do |day|
      day.send("#{weekday}?")
    end.send(*occurrence)
  end

  def mtg_on_teenth(weekday)
    TEENTH_DAYS.select do |day|
      Date.new(year, month, day).send("#{weekday}?")
    end.map { |day_of_month| Date.new(year, month, day_of_month) }.first
  end
end
