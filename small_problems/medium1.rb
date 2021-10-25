 require 'pry'
# Write a method that rotates an array by moving the first element to the end of the array.  the original
# arry should not be modified.
# do not use Array#rotate or Array#rotate!

# iterate through the array
# each iteration move the element up one
# if the element's index is 0 or arr.length
#    swap using -1 and 0
# else 
#    use the index to set the current element back one index
#  return the new arr

# the first element goes to the back arr = [1,2,3,4]
# arr[0] = arr[-1]  -> 4,2,3,4
# arr[1] = arr[0]   -> 2,3,4,
# arr[2] = arr[1]
# arr[3] = arr[2]
# use the index to set the current element back one index
# 

# arr = [7,3,5,2,9,1]    result = [4]
# arr = [7,3,5,2,9,1]    result = [7]
# arr = [7,3,5,2,9,1]    result = []


def rotate_array(arr)
  result = []
  last = arr[0]
  counter = 0
  loop do 
    break if counter >= arr.length - 1
    result[counter] = arr[counter + 1]
    counter += 1
  end
  result.push(last) 
  result
end

def rotate_arrayv2(arr)
  arr[1..-1] + [arr[0]]
end



p rotate_array([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) #== ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true


p rotate_arrayv2([7, 3, 5, 2, 9, 1]) #== [3, 5, 2, 9, 1, 7]
p rotate_arrayv2(['a', 'b', 'c']) #== ['b', 'c', 'a']
p rotate_arrayv2(['a']) == ['a']
x = [1, 2, 3, 4]
p rotate_arrayv2(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# messing around with matrix problem

arr = [
  [0,1,2,3],
  [11,12,13,4],
  [10,15,14,5],
  [9,8,7,6]
]

# [arr[0][0],arr[0][1]arr[0][2],arr[0][3]]

# [arr[1][3],arr[2][3],arr[3][3]]

# [arr[3][2],arr[3][1],arr[3][0]]

# [arr[2][0], arr[1][0]]

def count(matrix)
  result = []
  column = 0
  row = 0

  loop do 
    break if column >= matrix[row].length
    result << matrix[row][column] 
    column += 1
  end

  row = 1
  loop do 
    break if row >= matrix[0].length
    result << matrix[row][matrix[0].length - 1]
    row += 1
  end

  row = matrix.length - 1
  column = matrix.length - 2
  loop do 
    break if column < 0
    result << matrix[row][column]
    column -= 1
  end



end

p count(arr)

# Write a method that can rotate the last n digits of a number.  For example

# convert the integer to a string and then an arr
# loop through the rotate array method the number of times as the argument

# def rotate_arrayv3(arr)
#   arr[1..-1] + [arr[0]]
# end

# def rotate_rightmost_digits(int, num)
#   return int if num == 1
#   result = int.to_s.chars
#   counter = 0
#   loop do 
#     break if counter >= num
#     result = rotate_arrayv3(result)
#     counter += 1
#   end
# result.join.to_i
# end

# initialize a variable for the length of the string - 1
# 1. fingure out how to rotate the last 2 numbers


# str[0, str.length - 1 - num], str[length - 1] + str[str.length - num]
# return the string to an integer

# arr[1..-1] + [arr[0]]

def rotate_rightmost_digits(int, num)
  number = int.to_s.chars
  number[-num..-1] = rotate_arrayv2(number[-num..-1])
  number.join.to_i
end


p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2) #== 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913 
p rotate_rightmost_digits(735291, 6) == 352917


