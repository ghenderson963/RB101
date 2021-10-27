# Write a method that rotates an array by moving the first element to the end of the array
# The original array should not be modified.
# do not use Array#rotate or Array#rotate!

# [7, 3, 5, 2, 9, 1] => [3, 5, 2, 9, 1, 7]
# split the array into 2 parts 
#  1 the part that is going to end
#  2 the part that is moving up
# first = arr[-length..-1]   this would make more sense as arr[1..-1]
# second = arr[0]

# Put the 2 arrays together
#  first + second


def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


# Write a method that can rotate the last n digits of a number.
# Rotating just 1 digits results in the original number being returned.
# n will always be positive

# convert the int into an array
# split the array between 
# 1 the part that doesn't change arr[0..num]
# 2 the part that does change   arr[-num..-1]
# take the part that changes and send it to rotate_array
# put the 2 parts back together 
# return an integer

def rotate_rightmost_digits(int, num)
  arr = int.to_s.chars
  arr[-num..-1] = rotate_array(arr[-num..-1])
  arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


# Write a method that takes an integer as argument, and returns the maximum rotation of that
# argument.
# don't have to handle 00s


# convert the string arguement to an array and assign the arra to a variable.
# subtract 1 from the arrays length and assign it to a variable
# initialize a counter variable
# create a loop
# assign the back elements of the array a variable
# send the back elements and the loop counter to the rotate_rightmost_digits
# stop when counter >= to length
# return the converted array as an integer

# 1st rotation 735291 -> 352917 first rotation is move the first digit to the end and the rest down what the rotate_right...does
# 2nd rotation 352917 -> 329175 now keep the first digit in place and rotate 1. send 52917 arr[-1..-num] 1
# 3rd rotation 329175 -> 321759 first 2 digits in place and rotate 2

# arr[-1..-num] = rotate_rightmost_digits(arr[-num..-1],counter)
# stop when num >= length
# convert back to in

def max_rotation(int)
  arr = int.to_s.chars
  length = arr.length - 1
  counter = 0
  
  loop do 
     +
end


p max_rotation(735291) #== 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845