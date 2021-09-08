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

# create a loop to iterate through the array
# take the element at the end and make it the first element
# take the element next to last etc.


list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true
