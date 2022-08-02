items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*items, last|
  puts items.join(', ')
  puts last
end

gather(items) do | first, *mid , last |
  puts first
  puts mid.join(', ')
  puts last
end

gather(items) do | first, *rest |
  puts first
  puts rest.join(', ')
end

gather(items) do | first, second , third , last|
  all = [first, second, third, last]
  puts all.join(', ')
end