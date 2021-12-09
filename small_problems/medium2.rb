  require 'pry'

  # Write a program that reads the content of a text file and then prints the longest sentence in the file
  # based on number of words.
  # Sentences can end with . ! ?
  # any sequence of characters that are not spaces or sentence-ending characters is a word
  # print the number of words in the longest sentence.

  # 1. Read in the text file
  # 2. iterate through the string counting words as you go along.
  # 3. when you get to a . ! or ? stop
  #    create a loop
  #      count the words until you hit punctuation
  #      use the counter to count 
  #      when you hit a punctuation start over by setting count to zero
  #    if word is a word count it and push to temp arr
  #    if word is a punctuation
  #      compare the length of temp array to longest_sentence_count
  #      if bigger save it and copy temp_array over longest_sentence
  #      if smaller do nothing
  #      reset counter and longest_sentence start again

  # use each to iterate through each string
  #  if the last element of the string is a . ! or ?
  #    if temp_array is longer than longest array
  #      longest_array = temp_array
  #    else
  #      add word to temp_array
  #    end
  #    compare the length of temp_array to the length of longest_array
  #    


  # 4. see if the latest count is longer than the previous count
  # 5. if it is longer save the sentence and the count
  
  
  # 5. print the number of words in the longest sentence
  # 6. print the longest sentence

sentences = File.read("./sentences.txt").split
longest_sentence = []
temp_array = []

sentences.each do |word|
  temp_array << word
  if ['.', '!', '?'].include?(word[-1])
    longest_sentence = temp_array if temp_array.length > longest_sentence.length
    temp_array = []
  end
end

p longest_sentence.join(' ')
p longest_sentence.length



# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks
# false otherwise.

# take the word passed in and pass each letter to the blocks arr
#   iterate through the blocks array 
#     check if the letter matches one of the letters
#     if it does match put a 1 in the value of the hash
#     if it doesn't match move to the next pair
#     once you've gone through the blocks array
#     check if any value of the hash is greater than 1
#     if it is greater than 1 return false
#     if it is not greater than 1 return true

# split the string argument into letter substrings and assign it to a variable
# iterate through the substrings
#   1. see if the letter is included in any of the keys.
#   2. if it is included in add 1 to the value of that key
#   3. 
def get_counts
  pre_blocks = "B:O   X:K   D:Q   
   C:P   N:A    G:T   R:E   F:S
   J:W   H:U    V:I   L:Y   Z:M"
   blocks = pre_blocks.split(' ').map { |pair| pair.delete(':') }
   blocks.each_with_object({}) { |pair, counts| counts[pair] = 0 }
end

def block_word?(word)
  counts = get_counts
  word.chars.each do |letter|
    counts.each do |block,v_|
      counts[block] += 1 if block.include?(letter.upcase)
    end
  end

  !counts.values.any? { |count| count > 1 }
end

# store as a nested array
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

  def block_wordv2?(word)
    str = word.upcase
    BLOCKS.none? { |block| str.count(block) > 1 }
  end

p block_wordv2?('BATCH') #== true
p block_wordv2?('BUTCH') == false
p block_wordv2?('jest') == true


# Write a method that takes a string and returns a hash that contains 3
# 1 the percentage of characters in the string that are lowercase
# 2 the percentage of characters that are uppercase
# 3 characters that are neither 
# each string will contain at least 1 character

# percentage is num / total number * 100
# count the lowercase letters and then find percentage of total
# count the uppercase letters and then find percentage of total
# count numbers spaces and punc and find percentage of total

# initialize a hash that has the correct keys with percentage = 0
# initalize a variable for lowercase
# initalize a variable for uppercase
# intialize a variable for other
# initialize a variable and set the total to the length of the total string
# lowercase = (str.count('a-z') / total_characters * 100).rount(1)
# uppercase = (str.count('A-Z') / total_characters * 100).round(1)
# other = (str.count('^a-zA-Z) / total_characters * 100).rount(1)

def letter_percentages(str)
  results = {lowercase: 0, uppercase: 0, neither: 0 }
  total_characters = str.length
  results[:lowercase] = (str.count('a-z').to_f / total_characters.to_f * 100).round(1)
  results[:uppercase] = (str.count('A-Z').to_f / total_characters.to_f * 100).round(1)
  results[:neither] = (str.count('^a-zA-Z').to_f / total_characters.to_f * 100).round(1)
  results
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# Write a method that takes a string as an argument, and returns true if all 
# parentheses in the string are properly balanced, false otherwise.
# Parentheses must occur in matchig '(' and ')' pairs.

# need to find a '(' then find a ')'
# The number of '(' needs to match the number of ')'
# str.count('(') == str.count(')')
# will be false if ')' occurs before '('
# will be false if '(' occurs without another ')'

# count the number of '(' and ')' 
# for every '(' + 1 for every ')' -1
# break out if the total goes below 0 because it means you have a unbalanced phrase
# 
# iterate through the characters of the str
# when you find a '(' count + 1
# when you find a ')' count - 1
# break if count goes below 0
# return false if the count isn't 0

# initialize a variable to track the count
# iterate through the characters of the string
#   if character = '(' add 1
#   if character = ')' subtract 1
#   check if count below zero and break if it is
# check that count == zero

def balanced?(str)
  count = 0
  str.chars.each do |letter|
    count += 1 if ['(','[','{'].include?(letter)
    count -= 1 if [')',']','}'].include?(letter)
    break if count < 0
  end
  count.zero?
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('Gary is t)(he be()st') == false


# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
# depending on whether the triangle is equilateral, isoceles, scalene, or invalid.

# equilateral - all 3 sides are of equal length
# isosceles - 2 sides are of equal length and a 3rd is different
# scalene - all 3 sides are of different length
# invalid - sum of the lengths of the 2 shortest sides must be greater than
#           the length of the longest side. s1 + s2 > s3
#           lengths must be greater than 0

# Check for invalid
#   is the sum of the lengths of the 2 shortest sides longer than the longest side
# check for equilateral
# check isosceles
# check scalene

# input is int or float
# outputs is a symbol :isosceles or :scalene or :equalateral :invalid

# invalid if [s1,s2,s3].sort. shortest_side + middle_side > longest_side
#                             [s1, s2, s3].all? { |side| side > 0 }
# equalateral if   s1 == s2 == s3
#    s1 == s2 && s2 == s3
# isosceles   if   s1 == s2 || s2 == s3 || s1 == s3
#                  s1 == s3
#                  s2 == s3
#                  
#                  
# scalene     if   s1 != s2 && s2 != s3 && s1 != s3
#                  s1 != s2
#                  s2 != s3
#                  s1 != s3
# invalid  else    s1 or s2 or s3 < 0
#                  s1 + s2 != s3

# equif s1 == s2 && s2 == s3

# check invalid
# check equilateral
# check scalene
# else invalid

# arrange the sides by length and create variables for them
# check for type
# return type as a symbol

def triangle(s1, s2, s3)
  ss = [s1,s2,s3].sort.first
  ms = [s1,s2,s3].sort[1]
  ll = [s1,s2,s3].sort.last

  case 
  when ss + ms < ll || ss <= 0 || ms <= 0 || ll <= 0
    :invalid
  when ss == ll && ms == ll && ss == ms
    :equilateral
  when ss == ms || ms == ll || ss == ll
    :isosceles
  when ss != ms && ms != ll && ss != ll
    :scalene
  else
    :no
  end
end

p triangle(3, 3, 3) #== :equilateral
p triangle(3, 3, 1.5) #== :isosceles
p triangle(3, 4, 5)#== :scalene
p triangle(0, 3, 3) #== :invalid
p triangle(3, 1, 1) #== :invalid

puts ''
# Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid
# depending on whether the triangle is a right, acute, obtuse or invalid triangle.
# integer valued angles 
# specific in degrees

# right triangle - one angle is 90 
# acute triangle - all 3 angles are less than 90
# obtuse triangle - one angle is greater than 90 
# valid triangle - the sum of the angles must be exactly 180
# valid triangle - all angles greater than 0

# inputs 3 integers
# output symbol

# initialize an array and place the angles in it

# check for invalid
#   see if 0 is included or
#   sum of sides != 180
# check for right
#   look for 90 
# check for obtuse
#   look for greater than 90
# check for acute
#   make sure all angles are less than 90

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  case 
  when angles.include?(0) || angles.inject(:+) != 180
    :invalid
  when angles.include?(90)
    :right
  when angles.any? { |angle| angle > 90 }
    :obtuse 
  else 
    :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid


# Write a method that returns the number of Friday the 13ths in the year given by an argument.  You may assume that the year is greater
# than 1752.

# iterate through the year adding the friday the 13ths to an array
# count the array and return the number.

# date = Date(2015)
# date = date + 12
# count += 1 if date.friday?
# date = date + next_month
# break if date > date + 364

# initialize a variable to 0
# set date to the first day of the year passed in by the arguement
# move forward 12 days to the 13th
# Create a loop 
# check if the day is a friday
#   if it is a friday add one to count
# break if date > date + 364
# date = date.next_month
# return count
require 'date'

def friday_13th(year)
  count = 0
  date = Date.new(year) + 12

  loop do 
    count += 1 if date.friday?
    break if date.year > year
    date = date.next_month
  end
  count 
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2


# featured number is
#    odd
#    multiple of 7
#    digits only appear once 

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument
# Return an error message if there is no next featured number.

# input: integer
# output: integer / print an error message  
#     returns the next featured number > original number

# if num even - return 

# use some sort of loop loop through numbers and break when you get to the next featured number
# count up by 7 
# check if featured output
# 
# 
# loop
#   number = number + 1 
#   check not a multiple of 7
#     next
#   check even
#     next 
#    check only appear once
#      return current_number
#    print error
# 

def featured(num)
  loop do 
    num += 1
    return num if num % 7 == 0 && num.odd? && num.to_s.chars.uniq == num.to_s.chars
    break if num >= 9_876_543_210
  end
  puts "There is no number that satisfies the requirements."
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987

#featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

# Write a method that takes an Array as an argument, and sorts that Areray using the bubble sort algorithm.  
# The sort will be in-place.  Mutate the array passed as an argument.  
# the array contains at least two elements.

# input array
# output sorted array

# iterate through the array
# at each pass 
#  compare each pair of consecutive elements 
#   if the first is greater than the second then swap
# loop 
#   arr[counter], arr[counter + 1] =  arr[counter + 1], arr[counter + 1]
#   counter + 1
# break if arr.length < counter
# 
# 
# pass in and array
# create a loop where with each iteration
#   if [counter] > arr[counter + 1]
#      swap
#      add one to counter
#   break if counter >= arr.length
#   return arr

# first pass compare arr[0] to arr[1]
# second pass compare arr[1] to arr[2]
# third pass compare arr[2] to arr[3]

def bubble_sort!(arr)
  iterations = 0
  loop do 
    break if iterations > arr.length
    counter = 0
  
    loop do 
      break if counter >= arr.length - 1
      if arr[counter] > arr[counter + 1]
        arr[counter], arr[counter + 1] = arr[counter + 1], arr[counter] 
      end
      counter += 1
    end
    
    iterations += 1
  end
  arr
end

p array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]
p 
p array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
p 
p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Write a method that computes the difference between the square of the sum of the first n positive integers and the sume 
# of the squares of the first n positive integers.

# (1 + 2 + 3)^2 = 36
# (1^2 + 2^2 + 3^2) = 14

# add up the square of the sums
#  
# add up the numbers and then square them
# subtract the 2 numbers
# return the integer

# Can I assume the numbers are positive?
# assume no floats

def sum_square_difference(int)
  sum_of_squares = (1..int).to_a.inject(:+)**2
  square_of_sum = (1..int).to_a.inject() { |sum,num| sum += num ** 2 }
  sum_of_squares - square_of_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150 