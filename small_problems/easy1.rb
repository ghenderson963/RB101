# 1. Write a method that takes 2 arguements a string and a positive integer and prints the string as many times 
# as the integer indicates
# - takes 2 arguements string and positive integer
# - prints the strings as many times as the integer
# -- define the method which takes 2 arguements str, int
# -- iterate the number of the given integer

def repeat(str, int)
  int.times { puts str }
end

repeat('Hello', 3)

# 2. Write a method that takes one interger argument, which may be positive, negative, or zero.  The method returns true
# if the number's absolute value is odd.  You may assume that the argument is a valid integer value.
# input - integer positive negative or zero
# output - bolean true or false
# define the method
# take the absolute value of the integer
# evaluate if the integer is odd or even
# return true if the number is odd
#
#def is_odd?(num)
  #num % 2 != 0
#end

def is_odd?(num)
  num % 2 == 1
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Write a method that takes one arguement a positive integer and returns a list of the digits in the number
# Input - positive integer
# output - array of digits
# - define the method
# - initialize an array for the results
# - turn the number into a string
# - split the string up into substrings in an array
# - iterate through the array and change each string into an integer
def digit_list(num)
  num.to_s.chars.map(&:to_i)
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true



# write a method that counts the number of occurances of 
# element of a given array.
# case of the elements matters
# once counted print the count 
# Ex
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
# ctl /
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# initialize a new hash to store the results in
# iterate through the array in each iteration
# - IF the current element does not exist as a key in the hash
# -   add the element as a key and count the number of occurance
#      as the value
# - return the hash
# - iterate through the hash and print the key value pairs

def count_occurrences(arr)
  occurances = {}
  arr.uniq.each do |vehicle|
      occurances[vehicle] = arr.count(vehicle)
  end
  display_hash(occurances)
end

def display_hash(hsh)
  hsh.each { |k,v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Write a method that takes one argument -string- and returns a new string with the words in reverse order.
# input - string
# output - reversed string
# 
# - initialize a string for the result
# - split the string on the spaces
# - iterate through the resulting array backwards
# - adding each substring to the result string with a space in the middle of each substring
#  
def reverse_sentence(str)
  reversed  = []
  substring = str.split(' ')
  counter = -1

  loop do
    break if counter < -substring.length
    reversed << substring[counter]
    counter -= 1
  end

  reversed.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Write a method that takes one argument - a string containing one or more words and returns the given string with words
# that contain 5 or more characters reversed.  
# - each string will consist of only letters and spaces.
# - spaces should only be included when there are more than one word
#
# - split the string on spaces and add to an array
# - iterate through the array
# - if the current substring has more than 5 characters reverse it
# - convert the array back to a string

# def reverse_words(str)
#   list = str.split.map do |word|
#     if word.size >= 5
#       word.reverse
#     else
#       word
#     end
#   end
#   list.join(' ')
# end

def reverse_words(str)
  words = []

  str.split.each do |word|
    word.reverse! if word.length >= 5
    words << word
  end

  words.join(' ')
end

 puts reverse_words('Professional')          # => lanoisseforP
 puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
 puts reverse_words('Launch School')         # => hcnuaL loohcS

 # Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with
 # 1.  The length of the string should match the given integer.
# input: integer
# output: string of 1s and 0s
#
# initialize an empty string to hold the 1 and 0s
# loop the number of times of the iteger
# each iteration add a 1 or zero
#   -- check the number of iterations if odd put a 1 if even put a 0
# return the string

def stringy(num)
  result = ''
  num.times do |count|
    result << '1' if count.even?
    result << '0' if count.odd?
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(0)

# add an arguement to the method above that allows you to pick which to start with 1 or 0
# ex. puts stringy(4,0) => '0101'
# - Initiate a string to save the results to
# - initialize a string to track whether we are on a 1 or a 0 - set the string to the argument
# - iterate the number of times of the argument
# - for each iteration 
# -   add the character to the string
# -   change the character ig. if it is a 1 make it a 0 etc.
# - return the result string
#
def stringy2(num, character = 0)
  result = ' '
  num.times do
    result << character.to_s
    character = character == '1' ? '0' : '1'
  end
  result
end

puts stringy2(5,'0')
puts stringy2(3,'1')
puts stringy2(34)

# Array Average - Write a method that takes one argument an array containing integers, and returns the average of all numbers
# in the array.  The array will never be empty and the numbers will always be positive integers.
# - Input array
# - Output integer
# average = the sum / number of elements
#
# - sum the array and divide it by length of the array
# - return the average

def average(arr)
  arr.inject(:+) / arr.length
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Write a method that takes one argument, a positive integer, and returns the sum of its digits.
# def sum(num)
#   num.to_s.chars.inject([]) do |arr, element|
#     arr << element.to_i
#   end.inject(:+)
# end

def sum(num)
  num.to_s.chars.map(&:to_i).inject(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# Write a method that takes 2 arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
# If the boolean is true, the bonus should be half of the salary.  If the boolean is false, the bonus should be 0.
# - Input: positive integer and boolean
# - Output: integer
# if true
#   - total / 2
# else
#  - 0
# 
def calculate_bonus(salary, bonus)
  bonus ? salary / 2 : 0
end


puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000