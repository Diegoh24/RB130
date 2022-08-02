#step lets you iterate over a range of value, where each value
# in the iteration is the previous value plus a 'step' value.
# returns the original range

def step(start, last, step)
  while start <= last
    yield(start)
    start += step
  end
end

step(1, 10, 3) { |value| puts "value = #{value}" }
