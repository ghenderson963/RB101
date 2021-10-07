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

# Write a method that returns a list of all substrings of a string that are palindromic.
# Each substring must consist of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence as the substrings appear in the string.
# include duplicate palindromes.
# case matters.

def palindromes(str)
  results = []
  counter = 0
  loop do
    break if counter >= str.length
    
    counter.upto(str.length - 1) do |indx|
      sub_string = str.slice(counter..indx)
      results << sub_string if palindrome?(sub_string)
    end
    counter += 1
  end
    results.to_a
end

def palindrome?(str)
  str.length >= 2 && str == str.reverse && str.match(/[^1-9]/)
end


p palindromes('abcd') #== []
p palindromes('madam') #== ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Write a method that takes two arguments: 
# 1. is the starting number 
# 2. is the ending number.
# Print out all numbers between the 2 numbers, except if a 
# number divisible by 3 print Fizz
# if the number is divisible by 5 print "Buzz"
# if the number is divisible by 3 and 5 print FizzBuzz
# 

#  use upto to iterate through all of the numbers
# for each iteration 
# if the number is divisible by 3 print 'Fizz'
# if the number is divisible by 5 print 'Buzz'
# if the number is divisible by 3 and 5 print 'FizzBuzz'
# if neither print number

def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    if num % 3 == 0 && num % 5 == 0
      print 'FizzBuzz'
    elsif num % 3 == 0
      print 'Fizz '
    elsif num % 5 == 0
      print 'Buzz '
    else
      print "#{num} "
    end
  end
  puts ''
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(str)
  str.chars.map { |char| char + char }.join
end


p repeater('Hello') #== "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''



# Write a method that takes a string, and returns a new string in which every constant character
# is doubled.
# Vowels (a,e,i,o,u), digits and punctuation and whitespace should not be doubled.

# iterate through the string
#   each iteration 
#     check if the string is not an alpha character.
#     if it is alph
#       double it
#     if not alpha
#       do nothing
# 

def double_consonants(str)
  str.chars.map do |char|
    if char.match?(/[^a-zA-Z]/) || ['a','e','i','o','u'].include?(char)
      char
    else
      char + char
    end
  end.join
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Write a method that takes a positive integer as an argument and retuns that number with
# its digits reversed.

# Write a method that takes a positive integer as an argument and returns that number with its digits 
# reversed.

# check for leading zeros
# divide the number by 10 until the modulas is not zero
# the take the number
#   turn to a string
#   then an array
#   reverse the array 
#   join it back as a string
#

def reversed_number(int) 
  loop do
    result, mod = int.divmod(10)
    break if mod != 0
    int = result    
  end
  
  int.to_s.reverse.to_i
end

p reversed_number(12345) #== 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) #== 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# Write a method that takes a non-empty string argument, and returns the middle character or characters
# of the arguement.
# If the argument has an odd length return exactly one character.
# if the argument has an even length return exactly two characters.

# divide the str by 2 and 
# if the length of the string is odd
#   divide by 2 and return the string at the index
# if the length of the string is even
#   divide the length by 2 and grab the substring at - 1

def center_of(str)
  if str.length.odd?
    str[str.length / 2]
  else
    str[str.length / 2 - 1..str.length / 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'