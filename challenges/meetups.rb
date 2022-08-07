=begin
typically meetups happen montly on the same day of the week

construct objects that represent a meetup date
Each object takes a month number (1-12)
and a year(2022)

Your object should be able to determine the exact date of the meeting inthe specified
month and a year.

the day_strs that amy be given are strings 'first', second ...
case insesitive

'teenth' a made of word.
There are exactly 7 days that end in -teenth'
it's guaranteed that each day of the week will have exactly one date that
is the 'teenth' of that day in every month.
So every month has exactly one monday, tues, etc.

The fifth day of the month may not happen every month..

tests:
constructor
-takes two integer arguments : year and a month

instance method day, takes two string arguments (day, and meetup day day_str
-returns a Date object.
-if day with day_str does not exist, ex. no 5th wed on month 10, return nil.

method
going to need argument to determine if a month has the day_str (e.g. fifth)
and what day it falls on

day_strs:
first: first 'day'
second 'second' day
third: third 'day'
fourht, fifth
fifth 'may not occur'
last : last 'day'
teenth: every month has one 'teenth' day, days (12 - 19)

algo: make array of days.
going to need an array of all the days in the month,
so determine the first day of the given month.
Iterte x times (x being the number of days in the month)
add the day string of the day to the array.
=end
# require 'date'
class Meetup
  attr_reader :year, :month, :days

  DAYS = %w(sunday monday tuesday wednesday thursday friday saturday)

  def initialize(year, month)
    @year = year
    @month = month
    @days = all_days
  end

  def day(day, descriptor)
    send(descriptor.downcase, day.downcase)
  end

  private

  def all_days
    days = []
    current = 1

    while Date.valid_date?(year, month, current)
      days << DAYS[Date.new(year, month, current).wday]
      current += 1
    end

    days
  end

  def first(day_str)
    Date.new(year, month, find(1, day_str))
  end

  def second(day_str)
    Date.new(year, month, find(2, day_str))
  end

  def third(day_str)
    Date.new(year, month, find(3, day_str))
  end

  def fourth(day_str)
    Date.new(year, month, find(4, day_str))
  end

  def fifth(day_str)
    return nil unless find(5, day_str)
    Date.new(year, month, find(5, day_str))
  end

  def last(day_str)
    fifth(day_str) ? fifth(day_str) : fourth(day_str)
  end

  def teenth(day_str)
    teenths = days[12..18]
    Date.new(year, month, teenths.index(day_str) + 13)
  end

  def find(position, day_str)
    count = 0

    days.each_with_index do |day, idx|
      count += 1 if day == day_str
      return idx + 1 if count == position
    end
    nil
  end
end

require 'date'

# class Meetup
#   DAYS = { 'monday' => :monday?,
#           'tuesday' => :tuesday?,
#           'wednesday' => :wednesday?,
#           'thursday' => :thursday?,
#           'friday' => :friday?,
#           'saturday' => :saturday?,
#           'sunday' => :sunday? }

#   FIRST_DAY = { 'first' => 1,
#                 'second' => 8,
#                 'third' => 15,
#                 'fourth' => 22,
#                 'fifth' => 29,
#                 'teenth' => 13,
#                 'last' => nil }

#   def initialize(year, month)
#     @year = year
#     @month = month
#     @last_day = Date.new(@year, @month, -1).day
#   end

#   def day(weekday, schedule)
#     weekday = DAYS[weekday.downcase]
#     schedule = get_schedule(schedule.downcase)
#     schedule.detect do |day|
#       possible = Date.new(@year, @month, day)
#       break possible if possible.send(weekday)
#     end
#   end

#   def get_schedule(schedule)
#     first_day = FIRST_DAY[schedule] || (@last_day - 6)
#     last_day = [@last_day, first_day + 6].min
#     (first_day..last_day)
#   end
# end


class Meetup
  require 'date'

  ORDINALS = %w(first second third fourth fifth)

  def initialize(year, month)
    @start_date = Date.civil(year, month)
  end

  def day(weekday_name, descriptor)
    weekday = (weekday_name.downcase + '?').to_sym
    candidates = (@start_date...@start_date.next_month).select(&weekday)


    case descriptor.downcase
    when 'last'   then candidates.last
    when 'teenth' then candidates.select { |d| d.day.between?(13, 19) }.first
    else               candidates[ORDINALS.index(descriptor.downcase)]
    end
  end
end