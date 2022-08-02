birds = %w(raven finch hawk eagle)

def types(array)
  yield array
end

types(birds) { |_, _, *raptors| puts "Raptors: #{raptors.join(', ') }." }

raven, finch, *raptors = birds
p raven, finch, raptors