# frozen_string_literal: true

require "benchmark"
# Benchmark.bm do |x|
#   x.report do
# account_balance = 0
# 100.times.map do
#   Thread.new do
#     10000.times do
#       value = account_balance
#       value = value + 1
#       account_balance = value
#     end
#   end
# end.each(&:join)
# p "expected is 1 million"
# p "final balance in bank account is #{account_balance}"
#   end
# end
# @mutex = Mutex.new

# Benchmark.bm do |x|
#   x.report do
# 100.times do

#   counter = 0
#   threads = []

#   10.times do
#     threads << Thread.new do
#       1000.times do
#         # @mutex.synchronize do
#           temp = counter
#           # Do extra work to make it slower and allow context switch
#           (1..4000).reduce(:+)  # heavy CPU work
#           counter = temp + 1
#         # end
#       end
#     end
#   end

#   threads.each(&:join)

#   puts "Final counter: #{counter} (expected: 10000)"

# end

#   end
# end

# require 'concurrent-ruby'

# 100.times do
#   counter = Concurrent::AtomicFixnum.new(0)  # Thread-safe atomic integer

#   threads = 10.times.map do
#     Thread.new do
#       1000.times do
#         # Do extra work (simulate CPU heavy task)
#         (1..4000).reduce(:+)

#         # Atomically increment counter
#         counter.increment
#       end
#     end
#   end

#   threads.each(&:join)

#   puts "Final counter: #{counter.value} (expected: 10000)"
# end

mutex = Mutex.new

100.times do
  counter = 0
  10.times.map do
    Thread.new do
      mutex.synchronize do
        1000.times do
          temp = counter
          (1..4000).reduce(:+)
          counter = temp + 1
        end
      end
    end
  end.each(&:join)

  puts counter
end
