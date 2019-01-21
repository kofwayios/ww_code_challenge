# ww coding challenge
# by Xiao Meng Wei
# Jan 20 2019
#
# Question 3:
# Generate 500 random numbers and print the nth smallest number in a programming language of your choice.
#

# Notes: for this question, we assume that
# 1. n < 500
# 2. the list is not sorted
#
# total run time O(nlogn) -> determined by ruby sorting algorithm
# total space O(n) -> generated list of n numbers (500)
# a better solution would be using a heap to keep track of top k smallest elements
# not implementing since ruby does not have native support for such data structure
# in java, we can use priority queue to achieve this
#

# this generates 500 random numbers in [0, 999]
def generate(total = 500, max = 999)
  Array.new(total) { rand(0...max) }
end

def getKthSmallest(k, nums)
  res = nums.sort
  puts "Generated list of number: "
  puts "========================="
  puts nums
  puts "========================="
  res[k]
end

if ARGV.size == 1
  k = ARGV[0].to_i
else
  puts "!!! Incorrect number of arguments !!!\nUsage: q3.rb [k]\nk is int and 0<k<500"
  exit 1
end

numbers = generate(500, 999)
puts "The kth smallest element (#{k}) in the list is #{getKthSmallest(k, numbers)}"
