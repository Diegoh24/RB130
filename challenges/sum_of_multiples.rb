class SumOfMultiples
  attr_reader :set

  def initialize(*multiples)
    @set = multiples
  end

  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end

  def to(range)
    (0...range).each.with_object([]) { |num, arr| arr << num if mult?(num) }.sum
  end

  private

  def mult?(num)
    set.any? { |multiple| num % multiple == 0 }
  end
end
