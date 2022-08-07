class PerfectNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.classify(number)
    raise StandardError if number < 0
    PerfectNumber.new(number).classify
  end

  def classify
    if aliquot_sum == number
      'perfect'
    else
      aliquot_sum > number ? 'abundant' : 'deficient'
    end
  end

  def aliquot_sum
    divisors.sum
  end

  def divisors
    (1...number).to_a.select { |num| number % num == 0 }
  end
end

