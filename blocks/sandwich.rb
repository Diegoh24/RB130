# method that outputs how long something takes.
# the method doesn't care what something is; the method just cares about displaying how long it took

def time_it
  time_before = Time.now

  yield

  time_after = Time.now

  puts "It took #{time_after - time_before} seconds."
end

# this is a good use case for blocks, allowing the method callers to specify any action
# and use the method to time that action

time_it { sleep(3) }