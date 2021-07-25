## Write a program that solicits 6 numbers from the user, then prints a message that describes
## whether or not the 6th number appears amongst the first 5 numbers.
##
## ==> Enter the 1st number:
## 25
## ==> Enter the 2nd number:
## 15
## ==> Enter the 3rd number:
## 20
## ==> Enter the 4th number:
## 17
## ==> Enter the 5th number:
## 23
## ==> Enter the last number:
## 17
## The number 17 appears in [25, 15, 20, 17, 23].# 
#
## ask the user for an integer.  can be positive or negative.
## check that the input is an integer
## if the input is an integer add it to an array
## When you get to the sixth number check to see if the array includes the last number.
#
#numbers = []
#num = ''
#ORDINALS = ['1st', '2nd', '3rd', '4th', '5th', 'last']
#
#def integer?(input)
  #input.to_s == input.to_i.to_s
#end
#
#def to_ordinal(int)
  #ORDINALS.fetch(int)
#end
#
#6.times do |iteration|
#
  #loop do
    #puts "Enter the #{to_ordinal(iteration)} number: "
    #num = gets.chomp
    #break if integer?(num)
    #puts "Please enter an integer.  Try again."
  #end
#
  #numbers << num.to_i
#end
#
#last = numbers.pop
#puts "The number #{last} appears in #{numbers}" if numbers.include?(last)
#puts "The number #{last} does not appear in #{numbers}." if !numbers.include?(last)
#
#  
## Write a program that prompts the user for two positive integers, and then prints the 
## the results of the following operations on those two numbers: addition, subtraction, 
## product, quotient, remainder, and power.  Do not worry about validating the input.
##
## ==> Enter the first number:
## 23
## ==> Enter the second number:
## 17
## ==> 23 + 17 = 40
## ==> 23 - 17 = 6
## ==> 23 * 17 = 391
## ==> 23 / 17 = 1
## ==> 23 % 17 = 6
## ==> 23 ** 17 = 141050039560662968926103
#
## ask the user for the 2 numbers
## preform the operations + - * / remainder and power
#puts "==> Enter the first number:"
#num1 = gets.chomp.to_i
#puts "==> Enter the second number:"
#num2 = gets.chomp.to_i
#
#puts "#{num1} + #{num2} = #{num1 + num2}"
#puts "#{num1} - #{num2} = #{num1 - num2}"
#puts "#{num1} * #{num2} = #{num1 * num2}"
#puts "#{num1} / #{num2} = #{num1 / num2}"
#puts "#{num1} % #{num2} = #{num1 % num2}"
#puts "#{num1} ** #{num2} = #{num1 ** num2}"

# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters.  Spaces should not be counted as a character/
# "Please write word or multiple words: walk"
# => There are 4 characters in "walk"
# "Please write word or multiple words: walk, don't run"
# => There are 13 characters in "walk, don't run"

# string
# ask the user for a phrase
# assign the input to a variable
# remove the spaces from a copy of the phrase
# count the phrases length
# print the answer

print "Please write word or multiple words: "
phrase = gets.chomp

puts "There are #{phrase.gsub(' ', '').length} characters in \"#{phrase}\"."


# Create a method that takes two arguments, multiplies them together, and return the result.
# multiply(5,3) == 15

# 
def multiply(x,y)
  x * y 
end

p multiply(5,3) == 15

# Using the multiply method above write a method that computes the square of its argument
# (the square is the result of multiplying a number by itself).

def square(x)
  (x * x).abs
end

p square(5) == 25
p square(-8) == 64

# Write a function named xor that takes two arguments, and returns true if exactly one of its 
# arguments is truthy, false otherwise.  Note that we are looking for a boolean result instead 
# of a truthy/falsey value as returned by || or &&.

# Evaluate both arguements
# use case to return true or false

def xor?(operation1, operation2)
  return true if operation1 && !operation2
  return true if operation2 && !operation1
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Write a method that returns an array that contains every other element of an array that is passed in
# as an arguement.  The values in the returned list should be those values that are in the 1st, 3rd, 5th, 
# and so on.
# output = array
# input = array
# 1st , 3rd, 5th

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []

# output array should have all the even indices.
# algorithm
# iterate through the array
# check the index is odd
# if it is odd place it in a new array
# return the new array

# def oddities(arr)
  # counter = 0
  # result = []
  # loop do 
    # break if counter >= arr.length
    # result << arr[counter] if counter.even? # if the index is even grab it
    # counter += 1
  # end
# 
  # result
# end

def oddities(arr)
  result = []
  arr.each_with_index { |value, index| result << arr[index] if index.even?  }
  result
end


p oddities([2, 3, 4, 5, 6]) #== [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# Write a method that returns true if the string passed as an arguement is a pallindrome,
# false otherwise. 
# palindrome is same forward and backward.
# case matters 
# puncuation and spaces matter 
# downcase the string
# reverse the string 
# if the reversed string equals the original string Return true

def palindrome?(str)
  str.reverse == str
end

p palindrome?('madam') #== true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?('') == true

# Write a method that determines whether an array is palindromic; that is, the element values appear
# in the same sequence both forwards and backwards in the array

# 

def palindromic?(arr)
  arr.reverse == arr 
end

p palindromic?([1,2,3,3,2,1]) == true
p palindromic?([1,2,3,4,5,9]) == false
p palindromic?(['a','b','c','c','b','a']) == true
p palindromic?([]) == true
p palindromic?([1]) == true

# Write another method that returns true if the string passed as an argument is a plaindrome, false otherwise.
# The method should be case-insensitive, and it should ignore all non-alphanumeric characters.
# case-insensitive - downcase everything
# ingnore all non-alphanumeric characters (a-z,A-Z)

# downcase the string
# remove any non letter or numbers
# reverse the string

def real_palindrome?(str)
  new_str = str.downcase.delete('^a-z0-9')
  new_str == new_str.reverse
end



p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
p real_palindrome?('')


# Write a method that returns true if its integer argument is palindromic, false otherwise.
# single number is true
# zero is true
# empty is true

def palindromic_number?(int)
  int.to_s.reverse == int.to_s
end


p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(001232100)

