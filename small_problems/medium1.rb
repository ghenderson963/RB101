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

  loop do 
    matrix[0][2]

  result


end

p count(arr)
