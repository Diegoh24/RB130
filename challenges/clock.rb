=begin
create a clock independent of date

Can add and subtract minutes fromt he time represented by the clock object.
two clock objects that represent the same time should be equal to each other
Can not use any built in date or time functionality.

test cases:
class method Clock.at(hour)
chain a to_s method on the return value of clock

create a class method at(hour)
-instantiates a new class object and returns it-
-can take multiple arguments, last arg is 0 by default, 00
-returnsa Clock object

create a comparison method that compares two clock objects according to their time
create a to_s method that displays time in '00:00' format, returns a string

create a #+ and #- method that takes an argument and subtracts the integer argument
from the clock time.

create a helped method to conver the time into a string object..

have to wrap around subtractions
so if the time is 01:00 and you subtract 65 minutes,
the time object.to_s returns 11:55
=end

class Clock
  attr_reader :hour, :minute

  def self.at(hour, minute = 0)
    new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def ==(other_time)
    [hour, minute] == [other_time.hour, other_time.minute]
  end

  def -(minutes)
    if minute - minutes > 0
      @minute -= minutes
    else
      minutes.times do
        if minute == 0
          @hour = (@hour == 0 ? 23 : @hour - 1)
          @minute = 59
        else
          @minute -= 1
        end
      end
    end
    self
  end


  def +(minutes)
    if minute + minutes < 60
      @minute += minutes
    else
      minutes.times do
        if minute == 59
          @hour = (hour == 23 ? 0 : hour + 1)
          @minute = 0
        else
          @minute += 1
        end
      end
    end
    self
  end

  def to_s
    format('%02d:%02d', hour, minute)
  end
end


Clock.at(10) + 60