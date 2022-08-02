class Triangle
  attr_reader :kind, :sides

  def initialize(*sides)
    @sides = sides
    @kind = type
    raise ArgumentError if invalid_triangle?
  end

  def type
    case
    when equilateral? then 'equilateral'
    when isosceles? then 'isosceles'
    else                  'scalene'
    end
  end

  def invalid_triangle?
    sides.min <= 0 || sides.max >= sides.sum - sides.max
  end

  def equilateral?
    sides.uniq.size == 1
  end

  def isosceles?
    sides.uniq.size == 2
  end
end
