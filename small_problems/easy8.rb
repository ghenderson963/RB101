# Write a method that takes an array of numbers and then returns the sum of the sums of each of
# each leading subsequence for that Array.  You may assume that the Array always contains at least 
# one number

# arr[0] = total
# result << total + arr[1] = total
# total + arr[2] = total
# total + arr[3] = total

# initiate total to zero
# initiate an array = results
# iterate through the array
#  in each iteration push total onto result    # total = current element + existing totals
# use inject to sum the result array

def sum_of_sums(arr)
  result = 0
  total = arr.map { |num| result += num }
  total.inject(:+)
end

def sum_of_sumsv2(arr)
  total = 0
  sub_sums = 0
  arr.each do |num| 
    sub_sums += num
    total += sub_sums
  end
  total
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

p sum_of_sumsv2([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sumsv2([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sumsv2([4]) == 4
p sum_of_sumsv2([1, 2, 3, 4, 5]) == 35

# Write a simple program that asks for a noun, verb,adjective, and adverb.  Then writes a sentence using them.
# 
# print 'Enter a noun: '
# noun = 'dog'
# print 'Enter a verb: '
# verb = 'running'
# print 'Enter an adjective: '
# adjective = 'green'
# print 'Enter an adverb: '
# adverb = 'quickly'
# 
# 
# 
# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
# puts
# 
# parts_of_speach % {
  # noun: noun,
  # verb: verb,
  # adjective: adjective,
  # adverb: adverb
# }
# 
# File.foreach('./sentences.txt') do |line|
  # line.gsub!(/sentence_[1-9]+ = /,'')
  # puts "%s #{line}"
# end


# Write a method that returns a list of all substrings of a string that start at the beginning of the
# original string.
# The return value should be arranged in order from shortest to longest substring.

# initialize a integer as a counter
# create a loop
# break when the counter reaches the size of the arr
#   in each iteration 
#   add to the arr a slice from zero to the n index
# 

def leading_substrings(str)
  result = []
  counter = 0
  loop do
    break if counter >= (str.length)
    result << str.slice(0..counter)
    counter += 1
  end
  result 
end

def leading_substringsv2(str)
  results = []
  0.upto(str.length - 1) do |indx|
    results << str.slice(0..indx)
  end
  results
end

def leading_substringsv3(str)
  results = []
  str.chars.each_with_index do |_ , indx|
    results << str[0..indx]
  end
  results.to_a

end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p leading_substringsv2('abc') #== ['a', 'ab', 'abc']
p leading_substringsv2('a') == ['a']
p leading_substringsv2('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

p leading_substringsv3('abc') #== ['a', 'ab', 'abc']
p leading_substringsv3('a') == ['a']
p leading_substringsv3('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


# Write a method that returns a list of all substrings of a string.  The returned list 
# should be ordered by where in the string the substring begins. 

def substrings(str)
  results = []
  counter = 0
  loop do
    break if counter >= str.length
    
    counter.upto(str.length - 1) do |indx|
      results << str.slice(counter..indx)
    end
    counter += 1
  end
    results.to_a
end


 substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
