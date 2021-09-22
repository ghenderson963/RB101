require 'pry'

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a string that 
# represents that angle in degrees, minutes, and seconds.  
# use a degree symbol to represent degrees
# a single quote to represent minutes
# a double quote to represent seconds
# degree has 60 minutes and a minute has 60 seconds
DEGREE = "\xC2\xB0"

# separate the float into 2 numbers
# the first number becomes the degrees
# the second number is multiplied by 60
# repeat


# def get_number(flt)
#   arr = []
#   if [0, 360].include?(flt)
#     return [0,0,0]
#   else
#     3.times do 
#       first, second = flt.to_s.split('.')
#       second = '.'.concat(second).to_f
#       arr << first.to_f
#       flt = second * 60
#     end
#   end
#   arr
# end

# def dms(flt)
#   arr = get_number(flt)
#   format("%.2d",arr[0]) + "#{DEGREE}" + format("%.2d",arr[1]) + %Q(') + format("%.2d",arr[2]) + %(")
# end

  # take the right half and convert to a float and multiple by 60
  # split the new number and store the left half
  # take the second half and multiple by 60
  # store the left half
  # return the 3 numbers and format.
  # 

# 76.73 = 76 and 73
# store 76 in array
# .73 * 60 = 43.80
# store 43 in array
# .80 * 60 = 48
# store 48 in array


# working on a better method that is easier to read and understand
# the above fails if there is no decimal
# find the total seconds 
# 360 minutes in a degree
# 60 minutes in a second 
# The first part of the number becomes the degrees
# multiply the second part by 60 
# the first part becomes the minutes
# multiple the second part by 60 to get the seconds
# so
# 
SECONDS_PER_MINUTE = 60
def dms(flt)
  _, flt = flt.divmod(360)
  degrees, minutes = flt.divmod(1)
  minutes *= SECONDS_PER_MINUTE
  _,seconds = minutes.divmod(1)
  seconds *= SECONDS_PER_MINUTE

  format(%(#{degrees}#{DEGREE}%02d'%02d"),minutes, seconds)
end


puts dms(30) == %(30°00'00")  # 30 = 30 00 00
puts dms(76.73) == %(76°43'48") #76 degrees + 0.73 degrees * 60 = 43.8 = 76 degrees 43.8 minutes x 60 = 48 == 76degrees 43 minutes 48 seconds 
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

# modify the code above so it can handle degrees above 360 correctly.
# 
# 
# divide the original number by 360
# if the first number is negative
#   subtract
# keep the remainder
# 

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")

# Write a method that takes an array of strings, and returns an array of the same string values,
# except with the vowels removed
# (a,e,i,o,u)

# iterate through the array
# for each string check for vowels and delete them
# 
# def remove_vowels(arr)
  # arr = arr.map do |str|
    # str.chars.delete_if { |letter| ['a','e','i','o','u'].include?(letter.downcase) }
  # end
  # arr.map { |word| word.join }
# end

def remove_vowels(arr)
  arr.map { |word| word.delete('aeiouAEIOU')}
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Write a method that calculates and returns the index of the first Fibonacci number that has the number
# of digits specified as an argument.

# 

# start with 0 and 1
# add 1 + 1 = 2
# add 1 + 2 = 3
# add 2 + 3 = 5
# add 3 + 5 = 8

# x = 0 + 1 1
# x = x + 1 2
# x = 1 + x
# x = 2 + x

# [0,1,1,2,3]

# start with 0 and 1
# calculate the sequence
# for each number check if the size is equal to the size of the arguement
# if it is stop
# return the index 

# calculate the sequence
#
# initialize an empty array
# initialize a variable with the size of the arguement
# initailize a counter
# push 0 and 1 in the array
# add the value at index 0 to value at index 1
#    arr << arr[i -1] + arr[i]
# place the result in the array
# increment the counter by one
# check to see if the size of the latest value is greater or equal to the size of arguement
#     arr.last.to_s.size
# if it is the same size return the index 
# else keep going

def find_fibonacci_index_by_length(num)
  series = [0,1]
  i = 1
  loop do 
    series << series[i - 1] + series[i]
    i += 1
    return series.index(series.last) if series.last.to_s.size >= num
  end   
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847


# Write a method that takes an Array as an argument, and reverses its elements in place. 
# Mutate the array passed into this method.  The return value should be the same Array object.
# don't use reverse or reverse!
# so I want to return the original array

# first dump the original array into another array
# create a loop to iterate through the arrays
# in each iteration reverse add the elements into the original array  
# repeat the above until the size of the arr is reached

# initialize a new array
# use map to iterate through the original array
# initialize a counter at 0
# create a loop 
# with each iteration of the loop arr[i] = arr1[i - arr1.size]
# break the loop when arr.size is reached

# if counter is 0 other index must be -1
# if counter is 1 other index must be -2
# if counter is 2 other index must be -3

def reverse!(list)
  temp = []
  return [] if list.empty?
  list.map { |element| temp << element }
  counter = 0
  loop do
    list[counter] = temp[-counter - 1]
    counter += 1
    break if counter >= list.size
  end
  list
end

p list = [1,2,3,4] # list[-1] moves to list[0]  list[-2] moves to list[1]  list[-3] moves to list[2]
p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true
p 
p list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true
p 
p list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true
p 
p list = []
p reverse!(list) #== [] # true
p list == [] # true


# Write a method that takes an Array and returns a new Array with the elements of the original list in reverse order.

# def reverse(list)
#   temp_list = []
#   temp = []
#   return [] if list.empty?
#   list.map { |element| temp << element }
#   counter = 0
#   loop do
#     temp_list[counter] = temp[-counter - 1]
#     counter += 1
#     break if counter >= list.size
#   end
#   temp_list
# end

def reverse(list)
  list.inject([]) { |arr, element| arr.unshift(element) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true
p 
p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

# Write a method that takes two arrays as arguments, and returns an array that contains all of the values from the argument Arrays.
# There should be no duplication of values in the returned array even if there are duplicates in the original arrays.

# assign the 2 arrays to variables
# concatenate the 2 arrays together
# remove the duplicate arrays

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Write a method that takes an array as an argument and returns 2 arrays (as a pair of nested arrays)
# that contain the first half and second half of the original array.  If the original array contains an odd number of elements
# the middle element should be placed in the first half array.

# count the number of elements in the array
# if the number is even
#    split the array evenly
# if the number is odd
#    split the array with the extra element in the first array

# initialize a variable to hold the result array
# count the number of elements in the array
# if the size of the array is odd
#    slice the array with the extra element in the first array
# else split the array in the middle


def halvsies(arr)
  result = []
  size = (arr.size / 2.0).ceil
  first_half = arr.slice(0,size)
  second_half = arr.slice(size..-1)
 [first_half, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# Given an unordered array and the information that exactly one value in the array occurs twice
# (every other value occurs exactly once), how would you determine which value occurs twice?  
# Write a method that will find and return the duplicate value that is known to be in the array.

# iterate through the array 
# in each iteration check the count of the element
# if the count is greater than one return that number
# if the count is 1 keep going

# iterate through the array
# if the count of an element is greater than 1
#  return the element
#

def find_dup(arr)
  arr.each do |element|
    return element if arr.count(element) > 1
  end
end


p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# Write a method named include? that takes an array and search value as arguments.  This method
# should return true if the search value is in the array, false if it is not.  Don't use Array#include?

# count the number of search values that are in the array
# if the count is greater than 1 
#    return true
# else 
#     return false
# end

# def include?(arr, search_value)
#   return true if arr.count(search_value) >= 1
#   return false 
# end

def include?(arr, search_value)
  !!arr.find_index(search_value)
end


p include?([1,2,3,4,5], 3) #== true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each 
# have n stars.  The hypotenuse of the triangle should have one end at the lower-left of the triangle and the other
# end at the upper-right.

# put n - 1 ' ' then 1 *
# put n - 2 ' ' then 2 **
# put n - 3 ' ' then 3 ***

# create a loop 
# initialize a counter to zero
# break when the counter equals n
# each iteration 
#    puts n - counter ' ' + counter *

def triangle(n)
  counter = 1
  loop do 
    break if counter >= n + 1
    puts ' '
    (n - counter).times { print ' ' }
    counter.times { print '*' }
    counter += 1
  end
puts ' '
end


triangle(5)

#     *
#    **
#   ***
#  ****
# *****

triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********