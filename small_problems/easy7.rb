# Write a method that combines 2 arrays passed in as arguments, and returns a new array that contains all elements
# from both array arguments, with the elements taken in alteration.
# Assume that both input arrays are non-empty, and that they have the same number of elements.


# create a loop
# in each iteration of the loop 
#   take the first element from arr1 and put it in a new array
#   take the first element from arr2 and put it in the new array

def interleave(arr1, arr2)
  result = []
  counter = 0
  loop do 
    break if counter >= arr1.size
    result << arr1[counter] << arr2[counter]
    counter += 1
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents
# the number of characters in the string that are lowercase letters, one the number of characters that 
# are uppercase letters, and one the number of characters that are neither.


letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }