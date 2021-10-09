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

