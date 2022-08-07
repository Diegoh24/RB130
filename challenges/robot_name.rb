=begin
manages robot factory settings.

When a robot comes off the factory floor, they have no name
On boot a random name is generated

Every once in a while, the robot needs to be reset,
wiping its name, and generating another random name

Names must be random..

test cases:

the Name regex: range of characters the name can use:
starts with [A-Z]{2}
-starts with 2 A-Z characters.

-ends with 3 decimal characters, 0-9.

constructor takes no argument, generates a random name
-need a helped method, generate_name
-need a reset method.

-can't match a taken name,
-program must keep track of names it chooses
=end



class Robot
  attr_reader :name

  VALID_CHARS = ('A'..'Z').to_a + ('0'..'9').to_a

  @@names = []

  def initialize
    reset
    @@names << name
  end

  def reset
    @name = generate_name
  end

  private

  def generate_name
    VALID_CHARS.shuffle!
    letters, numbers = VALID_CHARS.partition { |char| ('A'..'Z').include? char }
    name = letters.pop(2) + numbers.pop(3)
    name.flatten.join
  end
end
