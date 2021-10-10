require 'pry'
# Create a method that takes 2 arguments, an array and a hash.  The array will contain 2 or more
# elements that, when combined with adjoining spaces, will produce a person's name.  The hash will contain
# 2 keys, :title and :occupation and the appropriate values.YOur method should return a greeting that uses 
# the person's full name, and mentions the person's title and occupation.

def greetings(arr, hsh)
  answer = <<-HEREDOC
    "Hello, #{arr[0] + ' ' + arr[1] + ' ' + arr[2]}!
     Nice to have a #{hsh[:title] + ' ' + hsh[:occupation]} around."
     HEREDOC
end


puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, ! Nice to have a Master Plumber around.

# Write a method that returns 2 times the number provided as an argument, unless the argument is 
# double number == return doubles as is
# a double number is:
# even number of digits
# left side digits are exactly the same as the right 44, 103103

# so if it's odd through it out ir even and you divide the length by 2 the 2 sides aren't equal
# if its even
# if after dividing the number by 2 the 2 sides aren't equal

# if odd
#   multiply it by 2
#  if even && both sides equal
#    num
#  else
#    2 * num
# NEED TO REVISIT THIS.

def equal_strings(str)
  str[0..str.length / 2 -1] == str[str.length / 2..str.chars.slice(str.length)]
end

def twice(num)
 return num if num.to_s.length.even? && equal_strings(num.to_s)
 return num * 2
end
  
 


p twice(5)
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Write a method that takes a number as an argument.  If the argument is a positive number, return the 
# negative of that number.  If the number is 0 or negative, return the original number.

# if the number is positive return the negative
# if the number is zero or negative return the number

def negative(num)
  num > 0 ? -num : num
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# Write a method that takes an integer argument, and returns an array of all integers, in sequence, between 1 and the 
# argument.
# Assume that the argument will always be a valid integer that is greater than 0.

# initiate an array to hold the results
# count up to the num
# each iteration push the number into the array

def sequence(num)
  (1..num).to_a.each_with_object([]) { |num, result| result << num }
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# Write a method that takes a string argument and returns true if all the alphabetic characters inside the 
# string are uppercase, and false otherwise.
# Characters that are not alphabetic should be ignored.

# test if the argument is equal to argument.upcase
def uppercase?(str)
  str == str.upcase
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# Write a method that takes a string as an argument and returns an array that contains every word from the 
# string, to which you have appended a space and the word length.
# Words in the string a separated by exactly one space
# any sub-string is a word.

def word_lengths(str)
  str.split.map { |word| word + ' ' + word.length.to_s }
end



p word_lengths("cow sheep chicken") #== ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==
   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") ==
   ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a 
# string that contains the last name, a comma, a space, and the first name.

def swap_name(full_name)
  full_name.split.reverse.join(', ')
end


p swap_name('Joe Roberts') == 'Roberts, Joe'

# Create a method that takes two integers as arguments.  The first argument is a count, and the second is the first number
# of a sequence that your method will create.  The method should return an array that contains the same number of elements
# as the count argument, while the values of each element will be multiples of the starting number.
# the count argument will always have a value of 0 or greater, while the starting number can be any integer value.
# if the count is 0 empyt list should be returned.

# initialize an array with num as the only element
# start at 1 and go upto 5
# each iteration
#   put the number + itself into results array
# stop when you get upto the count number
#  1 + 1 = 2
#  2 + 1 = 3
#  3 + 1 = 4
#  4 + 1 = 5

def sequence(count, num)
  result = []
  sum = 0
  count.times do |number| 
    sum = sum + num
    result << sum
  end
  result
end


p sequence(5, 1) #== [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

# Write a method that determines the mean of the 3 scores passed to it, and returns the letter value associated with
# that grade.

# calculate the average of the 3 scores
# use a case statement to find the associated grade and return it.

def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3

  case average
  when 90..100 then 'A'
  when 80..89 then  'B'
  when 70..79 then  'C'
  when 60..69 then  'D'
  else              'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# Write a method which takes a grocery list of fruits with quantities and converts it into an array of 
# the correct number of each fruit.

# iterate through the list
# for each fruit count pair
#   add the fruit aa many times as called for
#   push into a results array
# return the array

def buy_fruit(list)
  results = []

  list.each do |item|
    item[1].times { results << item[0] }
  end
  results
end

def buy_fruitv2(list)
  list.map { |fruit, count| [fruit] * count }.flatten
end


p buy_fruitv2([["apples", 3], ["orange", 1], ["bananas", 2]]) #==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

  # given the array:
  words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
    'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
    'flow', 'neon']

    puts
    puts 


  # Write a program that prints out groups of words that are anagrams.  Anagrams are words that have the same exact letters
  # in them but in a different order.

  # iterate through the words array
  # for each word
  #   break it into individual letter substrings 
  #   sort the array
  # iterate through the rest of the words array comparing each word 
  # push those words that match into a results array

  def anagrams(words)
    result = words.map do |word|
      normalized_word = word.chars.sort
      words.select do |outside_word|
        outside_word.chars.sort == normalized_word
      end
    end
       result.each { |list| p list } 
  end

anagrams(words) 
# ["demo", "dome", "mode"]
# ["neon", "none"]
#(etc)