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

print 'Enter a noun: '
noun = gets.chomp 
print 'Enter a verb: '
verb = gets.chomp
print 'Enter an adjective: '
adjective = gets.chomp
print 'Enter an adverb: '
adverb = gets.chomp



puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
puts 

File.foreach('./sentences.txt') do |line|
  line.split.map do |
end
