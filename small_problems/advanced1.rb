  require 'pry'

# Write a madlibs program that reads in some text from a file and then plugs in a selection of randomized nouns,
# verbs, adjectives, and adverbs into that text and prints it.

# 1. read in text from file
#
# 2. iterate through each line
# 3. if you git a %{} look up in a hash for the appropriate response
# 4. put the response in the file 
# 5. write the new text to the screen
#
hsh = {
  "adjective" =>['quick', 'lazy', 'sleepy', 'ugly'],
  "noun" => ['fox', 'dog', 'head', 'leg'],
  "verb" => %w( jumps lifts bites licks ),
  "adverb" => %w( easily lazily noisily excitedly )
}


File.foreach("sentences2.txt") do |line|
  puts format(line, adjective: hsh['adjective'].sample,
                    noun:      hsh['noun'].sample,
                    verb:      hsh['verb'].sample,
                    adverb:     hsh['adverb'].sample)
end

# Write a method that displays an 8-pointed star in an n x n grid, where n is an odd integer that is supplied as an 
# argument to the method.  The smallest such star you need to handle is a 7 X 7 grid.

# 3 things to know
# 1. number of spaces per row = n / 2 -1
# 2. number of stars in the middle always == n
# 3. where the middle is middle = n /2 - 1
#
#(7)
#middle = 7 / 2 = 3
# starting_spaces = 0
# between_spaces = middle - 1 = 2

# print " " * starting_spaces
# print "*" 
# print " " * between_spaces
# print "*"
# print " " * between_spaces
# puts "*"

# recalculate starting spaces and between_spaces
# starting_spaces += 1
# between_spaces -+ 1
#
# break when starting_spaces == middle + 1

# 2 loops
# line = ''
# innerloop breaks when line.length > n
# line << starting_spaces * " "
# line <<  "*"
# line << between_spaces * " "
# line << "*"
#
# break if line.length <= n
# puts line


# starting_spaces += 1
# between_spaces -+ 1


# outer_loop 


# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

def build_line(starting_spaces, between_spaces, n)
  line = ''
  line << " " * starting_spaces unless between_spaces < 0
  3.times do 
    line << "*"
    line << " " * between_spaces
    break if line.length > n
  end
  line
end

def star(n)
  middle = n / 2
  starting_spaces = 0
  between_spaces = middle - 1
  
  loop do
    puts build_line(starting_spaces, between_spaces, n)
    starting_spaces += 1
    between_spaces -= 1
    break if between_spaces < 0
  end
  
  puts "*" * n
  starting_spaces = middle - 1
  between_spaces = 0

  loop do 
    line = ''
    puts build_line(starting_spaces, between_spaces, n)
    break if starting_spaces <= 0
    starting_spaces -= 1
    between_spaces += 1 
  end
puts " "
end
# print_row
# spaces = ' ' * (middle - 1)
# line = Array.new(3, '*').join(spaces)
# puts line.center(n)
#


# refactoring a bit..../
# use center with puts to eliminate the starting+spaces
# need to calculate how many spaces
# spaces = middle -1
# print it centered on the grid
# middle.downto(1) { |distance| print_row(n, middle) }
# puts 
#  

def print_row(distance, n)
  spaces = ' ' * (distance - 1)
  line = Array.new(3, '*').join(spaces)
  #binding.pry
  puts line.center(n)
end

def starv1(n)
  middle = (n - 1) / 2
  middle.downto(1) { |distance| print_row(distance, n)}
  puts '*' * n
  1.upto(middle) { |distance| print_row(distance, n)}
end



starv1(7)
puts ''
star(9)
star(11)

#*  *  *
 #* * *
  #***
#*******
  #***
 #* * *
#*  *  *

# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# A 3 x 3 matrix can be represented by an array of arrays in which the main array and all
# of the sub-arrays has 3 elements.

# Write a method that takes a 3 x 3 matrix and returns the transpose of the original matrix.  
# do not modify the original matrix

# to transpose a matrix you swap the rows by the columns
# build a new matrix by using matrix[0][0], matrix[1][0], matrix[2][0]
#                             matrix[0][1], matrix[1][1], matrix[2][1]
#                              matrix[0][2], matrix[1][2], matrix[2][2]

# input 3 x 3 nested array
# output 3 x 3 nested array
# initialize a variable to hold the changing array
# iterate through the nested arrays result = [[]]
#  first loop 
#    take the first index of all the arrays and make an array
#     loop
#       iterate through the 3 arrays each iteration grab the 1st index and shovle it into an array 
#            .each_with_object { |result, arr| result << arr[0]}
#                new_array << 
#    take the second index of all the arrays and make an array
#    take the third index of all the arrays and make an array
#  put all of the arrays in another array

def transpose(matrix)
  new_matrix = []
  
  0.upto(2) do |num|
    temp = matrix.each_with_object([]) { |arr, result| result << arr[num] }
    new_matrix << temp
  end
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

  # [
  # [matrix[0][0], matrix[1][0], matrix[2][0]],
  # [matrix[0][1], matrix[1][1], matrix[2][1]],
  # [matrix[0][2], matrix[1][2], matrix[2][2]]
  # ]


new_matrix = transpose(matrix)


p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Write a transpose! method change the matrix in place.

# must move the arrays around in the larger array 
# 2 loops 
#  1st loop
#     create a counter to track the columns
#  2nd loop 
#     create a counter to track the rows
#   shovle new arrays into the old matrix

#  pull out the first element of the rows and put them in an array
#   initialize a variable to store the array
#   iterate over the rows
#   in each iteration take the first element [0][0] [0][1]  [0][2]
#   add the array into the matrix
#  pull out the second element of the rows and put them in an array
#   
#  pull out the third element of the rows and put them in an array 
# push the 3 rows back into the matrix
#  
# iterate through the row and move 
#     
def transposev2(matrix)
  (0..2).each do |column_number|
    (0..2).map do |row_number|
      matrix[column_number][row_number] = matrix[row_number][column_number]
    end
  end
   matrix
end

new_matrix = transposev2(matrix)
p new_matrix #== [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix #== [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Now make the transpose method from the previous exercise so that it works with any size matrix

# input any matrix.  array of arrays
# output the size of the output matrix will equal the number of elements in the arrays

# initialize a variable for the new_matrix
# find the number of elements in one of the inner arrays column_number
# loop1 through the arrays with the column_number from 0 to column_number
# loop2 through the arrays with the row_number from 0 to length of the matrix (how many arrays are in the array)
#   each iteration of loop2 push the new row into the new_matrix
# return the new_matrix

def transposev3(matrix)
  new_matrix = []
  column_number = matrix.first.length - 1
  row_number = matrix.length - 1
 
  (0..column_number).each do |column|
    test_row = (0..row_number).map { |row| matrix[row][column] }
    new_matrix << test_row
  end

  new_matrix
end


puts
p transposev3([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transposev3([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transposev3([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transposev3([[1]]) == [[1]]

# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise

# [
#  [3, 4, 1],
#  [9, 7, 5],
#  [6, 2, 8]
#]

# 2,0 -> 0,0
# 1,0 -> 0,1
# 0,0 -> 0,2

# loop three times
#   move all of the same indexes into arrays
# flatten each arr
# reshuffle the arrays  maybe partition

def rotate90(matrix)
  new_matrix = []      
    row_size = matrix.first.size - 1
    (0..row_size).each do |num|
      new_row = []
      matrix.each do |arr|
        new_row << arr.select { |element| arr.index(element) == num }
      end    
      new_matrix << new_row.flatten.reverse
    end
  new_matrix  
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
#new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
#p new_matrix3 == matrix2

# modify the solution above to rotate 90,180,270, and 360 degrees
# 
def degrees_to_number(degrees)
  case degrees
  when 90 then return 1
  when 180 then return 2
  when 270 then return 3
  when 360 then return 4
  end
end


def rotatex(matrix, rotation)
  degrees_to_number(rotation).times do
    temp_matrix = []
    row_size = matrix.first.size - 1
    (0..row_size).each do |num|
      new_row = []
      matrix.each do |arr|
        new_row << arr.select { |element| arr.index(element) == num }
      end

      temp_matrix << new_row.flatten.reverse
    end

    matrix = temp_matrix 
  end

  matrix
end


new_matrix1 = rotatex(matrix1, 360)
new_matrix2 = rotatex(matrix2, 90)
#new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))
puts 
p new_matrix1 #== [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]


# Fix the bug in the code below.  It should resturn:
# []
# [21]
# [9, 16]
#[25, 36, 49]

# The code below returns nil for the last three the empty array returns an empty array.


def my_method(array)
 return [] if array.empty?

  array.map do |value|
    value * value
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])

# buring the map inside a conditional if statement return nil because that is what a conditional statement returns in ruby

# Write a method that takes 2 sorted arrays as arguments, and returns a new array that contains all elements from both arguments
# in sorted order.
# don't sort the result array. build the result array one lement at a time in the proper order.
# do not mutate the input arrays.

# iterate through both arrays and compare them one at a time
# the smaller element goes first.

# initialize and array to hold the result array
# merge the 2 arrays
# check the 1st element with the 2nd element
# if 2nd element is smaller swap the elements
# if the 2nd number is larger check the next element
#  once you've gone through all the numbers do the same to the next number
#
# need 2 loops 
# outer loop will hold the place
# inner loop will run the checks

# first element in the array
#   compare with other numbers 
#   stop swapping when you reach the end 
arr = [1,5,9,2,6,8]
counter1 = 1

loop do 
  break if counter1 >= arr.size
  counter = 0
  loop do 
    break if counter >= (arr.size - 1)
    if arr[counter] > arr[counter1]
      arr[counter], arr[counter1] = arr[counter1], arr[counter]
    end
    counter += 1
  end
    counter1 += 1
end
p arr 






# if element1 > element2
#   swap the numbers


# def merge(arr1, arr2)
#   result = []
#   arr = arr1 + arr2
#   counter = -1
#   counter1 = 0
#   loop do 
#     loop do
#       counter += 1
      
#       next if arr[counter] < arr[counter + 1]
      
#       arr[counter], arr[counter + 1] = arr[counter + 1], arr[counter]
      
#       break if counter > arr.size - 2
      
#     end
#   counter1 += 1
#   binding.pry
#   break if counter1 > arr.size - 2
#   end
# arr
# end


#   arr.map do |element1|
#     arr.each do |element2|
#       next if element1 > element2
#       if element1 < element2
#         result << element1 << element2
#       end
#       #p result
#     end
    
#   end
#     result  
# end

[]
#p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]


# 0.upto(arr1.size).each do |element1|
#   0.upto(arr2.size).each do |element2|
#     case 
#     when element1 > element2 
#       result << element1 << element2
#     when element2 > element1
#       result << element2 << element1
#     when element1.nil?
#       result << element2
#     when element2.nil?
#       result << element1
#     end
#   end

# Write a method that takes two sorted Arrays as arguments, and returns a new array that contains all elements
# from both arguments in sorted order.
# input: 2 sorted arrays
# output 1 sorted array

# compare the first 2 elements
# if one is smaller than the other put it in the array then put the other element
# if they are the same size choose one to put in the array first
# if one of them is nil just put the other in  nil? 
# stop when you get to the end of the longest array
# return the new array

# iterate through both arrays
# on each iteration
#   check if nil if it is nil then only add the none nil elements

#   if elements equal put them both in the result array
#   if element1 > element2 check the element2 next element isn't equal
#   if they are equal add the 2 elements and the 1 
#   if element2 > element1 check the element1 next element for equal
#   if it is equal move all 3 to the array

# what if I did it element by element?
# setup the result array
# check the 2 numbers put the lowest one in the result array
# move to the other array and check the number against the result array and then the other array put the lowest in the result
# 

# [1, 5, 9], [2, 6, 8]
# check first element vs. second element put lower in result -- result = [1]
# if [arr1[0],arr2[0]].include?(nil)
#   arr1[0].nil? ? result << arr2[0] : result << arr1[0]
# arr1[0] <= arr2[0] then result << arr1[0]
# arr2[0] <= arr1[0] then result << arr2[0] 
# arr2[0] <= arr1[1] then result << arr2[0]
# check check the 2nd number 2nd array against the next element in arr1 put lower in result array -- result = [1,2]
# start over only with arr1 second element
# 

# def merge(arr1, arr2) 
#   result = []

#   indx = 0
#   loop do
#     break if result.size >= arr1.size + arr2.size
#     #binding.pry
#     if 
#     result << arr2[indx + 1] if arr2[indx + 1].nil?  && arr2[indx + 1] <= arr1[indx]
#     case
#     when [arr1[indx],arr2[indx]].include?(nil)
#       #binding.pry
#       arr1[indx].nil? ? result << arr2[indx] : result << arr1[indx]
#     when arr1[indx] <= arr2[indx]
#       result << arr1[indx]
#     when arr2[indx] <= arr1[indx] then result << arr2[indx]
    
#     end
    
  
#   #binding.pry
#   #result << arr2[indx] << arr1[indx + 1] if arr1[indx + 1].nil? || arr2[indx] <= arr1[indx + 1]
#   indx += 1

#   end

#   result
# end

# def merge(arr1, arr2)
#   result = []
#   indx = indx
#   loop do 
#     break if indx >= arr1.size && indx >= arr2.size
#     case
#     when arr1[indx].nil?
#       result << arr2[indx]
#     when arr2[indx].nil?
#       result << arr1[indx] 
#     when arr1[indx] == arr2[indx]
#       result << arr1[indx] << arr2[indx]
#     when arr1[indx] < arr2[indx]
#        if arr1[indx + 1] == arr1[indx]
#         result << arr1[indx + 1] << arr1[indx] << arr2[indx]
#        else
#         result << arr1[indx] << arr2[indx]
#        end
#     when arr2[indx] < arr1[indx]
#       if arr2[indx + 1] == arr2[indx]
#         result << arr2[indx + 1] << arr2[indx] << arr1[indx]
#        else
#         result << arr2[indx] << arr1[indx]
#        end
#       result << arr2[indx] << arr1[indx]
#     else    
#       puts 'pancake'
#     end
#   indx += 1
#   end
# result 
# end

# start with arr1
# iterate through the array in each iteration
# check if there are any elements > that current element.
#   if there is put it in result
#   if there isn't put original number in result.
#   keep track of the arr2 number and start there the next iteration
#  

# def merge(arr1, arr2)
#   result = []
#   indx = 0

#   loop do
#     break if result.size >= arr1.size + arr2.size
#     arr1.each_with_object([]) { |element1| element1 == arr2[indx] }
#     binding.pry
#     indx += 1
#   end
#   result
# end

# iterate through arr1
# in each iteration 
#  set up a loop 
#   the loop breaks when element2 > element1
#   put arr2[element2] in as long as it is less than or equals element1
# put element1 in result

def merge(arr1, arr2)
  result = []
  indx = 0
  arr1.each do |element1|
    loop do
      break if indx >= arr2.size || element1 <= arr2[indx]
      result << arr2[indx]
      indx += 1
    end
    result << element1
  end

  result.concat(arr2[indx..-1])
end

p merge([1,1,2,6], [1,1,2,5]) == [1,1,1,1,2,2,5,6]
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

# Sort an array of passed in values using merge sort.  You can assume that 
# this array may contain only one type of data.  And that data may be either 
# all numbers or all strings.
# input array
# output same? array sorted

# Get to each element being an array of only itself.
# length of the input array
# itterate through the input array
#   on each iteration
#     put each element in an array
#     add it to the output array
#  
# from left to right Merge the numbers back together 2 at a time
#    also sort the numbers each time you do it
#     if only one number 
#   
# [[9],[5],[7],[1]]
# [[5,9]]


  # going to return and array with the num
  # every time it is going to half the number of arrays by adding [[arr[x], arr[y]]

  # 
  # 

  # After some googling
  # 1. if there is only 1 element in the array return the array
  # 2. divide the array recursively into 2 halfs until you can't divide it anymore
  # 3. merge the smaller lists into new list in sorted order

# 1. if intial array == 1 return array
# 2. divide the array
# 3. sort the smaller lists
#    loop through each arr at the same time
#      each iteration if a > b
#        add b to the end of c
#        remove b[0] from b
#       else
#         add a to the end of c
#         remove a from a
#       end if 
#     end loop

# def merge(arr1, arr2)
#   arr3 = []
#   element = 0
#   temp_arr1 = arr1
#   temp_arr2 = arr2

#   loop do 
#     break if arr1.empty? || arr2.empty?
#      binding.pry
#     if arr1[element] > arr2[element]
#       arr3 << arr2[element]
#       arr1.delete(temp_arr2[element])
#     else
#       arr3 << arr1[element]
#       arr2.delete(temp_arr1[element])
#     end
#     element += 1
#   end

#   temp_arr1.each do |ele|
#     arr3 << ele
#     arr1.delete(arr1[ele])
#   end

#   temp_arr2.each do |ele|
#     arr3 << ele
#     arr2.delete(arr2[ele])
#   end
  
#   arr3

# end


def merge_sort(arr)
  size = arr.length
  return arr if size == 1

  arr1 = arr.slice(0..size/2 - 1)
  arr2 = arr.slice(size/2 - 1 + 1..-1)
  
  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)

  merge(arr1, arr2)
end






p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

