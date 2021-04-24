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
  arr.each do |vehicle|
    if !occurances.has_key?(vehicle)
      occurances[vehicle] = arr.count(vehicle)
    end
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
