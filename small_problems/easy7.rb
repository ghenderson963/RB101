require 'pry'

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

# number of lowercase (/a-z/)
# number of uppercase (/A-Z/)
# non alphabetic characters (/^A-Za-z/)

# initialize a variable that points at a new hash object
# convert the string into an array of characters
# for each substring check if it is a alpha or not
#    if the character is alpha
#       if it is upper put in upper
#       if it is lower put in lower
#    if not alpha 
#       put in neither

def letter_case_count(str)
  hsh = {lowercase: 0, uppercase: 0, neither: 0}
  str.chars.each do |character|
    if character.match?(/[a-zA-Z]/)
        hsh[:lowercase] += 1 if character.downcase == character
        hsh[:uppercase] += 1 if character.upcase == character
    else
      hsh[:neither] += 1
    end
  end
  hsh
end



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Write a method that takes a single String argument and returns a new string that contains the original value
# with the first character of every word capitalized and all theother letters lowercase.

# Assume that words are any swquence of non-black characters.

# split the phrase into sub-strings.
# capitalize the first letter of each letter.

def word_cap(phrase)
  phrase.split.map(&:capitalize).join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Write a method that takes a string as an argument and returns a new string in which every uppercase letter
# is replaced by its lowercase version, and every lowercase letter is replaced by its uppercase version.
# do not use String#swapcase

# convert the string into an array
# iterate through each substring
# convert each sub-string into an array of letters
# iterate through each letter
# if the letter is upcase go down
# if the letter is down go up

# use match?(/[a-z]/)
#     match?(/[A-Z]/)

def swapcase(phrase)
  answer = phrase.chars.map do |letter|
    if letter.match?(/[A-Z]/)
      letter.downcase
    elsif letter.match?(/[a-z]/)
      letter.upcase
    else
      letter
    end
  end
  answer.join
end


p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Write a method that takes a String as an argument, and returns a new String that contains the original value
# using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters
# are lowercase.
# Characters that are not letters should not be changed.

# convert the string into an array
# iterate through the array
# if not alpha next
# if the index is odd
#   upcase
# if the index is even
#   downcase
# convert the array into a string
#   !letter.match?(/[a-zA-Z]/)

def staggered_casev1(phrase)
  count = -1
  phrase.chars.map do |letter|
    count += 1
    if count.odd?
      letter.downcase
    elsif count.even?
      letter.upcase
    else
      letter
    end
  end.join
  
end

p staggered_casev1('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_casev1('ALL_CAPS') == 'AlL_CaPs'
p staggered_casev1('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Modify the method above so it ignores non-alphabetic characters when determining whither
# it should uppercase or lowercase each letter.

# initialize a variable to track upcase or downcase
# convert the string into an array
# iterate through each sub-string in the array
#    1. check if the sub-string is alpha
#         if upcase turn upcase the sub-string
#         if downcase turn downcase
#         change the case variable
#       else
#         place the substring with no changes


def staggered_casev2(phrase)
  upcase = true
  result = ''
  phrase.chars.each do |char|
    if char =~ /[a-zA-Z]/
      if upcase 
        result += char.upcase
      else
        result += char.downcase
      end
      upcase = !upcase
    else
      result += char
    end
  end 
  result
end

p staggered_casev1('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_casev1('ALL CAPS') == 'AlL cApS'
p staggered_casev1('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Modify the above method so that so the caller can determine whether non-alphabetic characters should be counted
# when determining the upper/lowercase state.

# initialize variable for the result string
# initualize a case variable and set it to true
# initialize a variable to track whether or not we count non-alpha
# set the above variable based on count or nocount set it to true or false
# if we count non-alpha
#   if upcase 
#     change to upcase
#   if upcase == false
#     change to downcase
# if we don't count non-alpha
#   if upcase
#     change to upcase
#   if downcase
#     change to downcase
#   else
#     add the char
# 



def staggered_casev3(phrase, count_alpha)
  if count_alpha
    staggered_casev1(phrase)
  else
    staggered_casev2(phrase)
  end

end

p staggered_casev3('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
p staggered_casev3('ALL CAPS', false) == 'AlL cApS'
p staggered_casev3('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_casev3('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
p staggered_casev3('ALL_CAPS', true) == 'AlL_CaPs'
p staggered_casev3('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'

# write a method that takes an array of integers as input, multiplies all the numbers together, divides the result
# by the number of entries in the Array, and then prints the result rounded to 3 decimal places.  Assume the array
# is non-empty.

# initialize a variable to hold the result
# iterate through the array
#   during each iteration
#    multipley the number with the result
# take the result and divide it by the number of elements in the array
# round the result to 3 decimal places

def show_multiplicative_average(arr)
  result = 1.0
  arr.each { |num| result *= num }
  result = (result / arr.length)
  format('%.3f', result)
end



p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667 

# Write a method that takes 2 array arguments in which each array contains a list of numbers and returns a new array
# that contains the product of each pair of numbers from the arguments that have the same index.  
# Assume that the arguments contain the same number of elements.

# brut force
# initialize an array for the results
# initialize a counter to zero
# create a loop and iterate through the arrays
#   in each iteration multiply the similar indexes
#   pass them into the results array
# return the results array

def multiply_list(arr1, arr2)
  results = []
  counter = 0
  loop do 
    break if counter >= arr1.length
    results << arr1[counter] * arr2[counter]
    counter += 1
  end
  results
end

def multiply_listv2(arr1, arr2)
  results = []
  arr1.each_with_index { |num, index| results << num * arr2[index] }
  results
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_listv2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Write a method that takes two Array arguments in which each array contains a list of numbers, 
# and returns a new array that contains the product of every pair of numbers that can be formed 
# between the elements of the two arrays.
# sort the results by increasing value
# assument that neither argument is an empty array.

# intialize an array for the results
# create 2 loops 
#   outer loop 
#     iterate through arr1
#     inner loop
#       in each iteration multiply arr1 element with every element in the other array.
#       place the result of each in the results array
# sort the results array
# return the results array
#  

def multiply_all_pairs(arr1, arr2)
  results = []
  arr1.each do |num1|
    arr2.each do |num2|
      results << num1 * num2
    end
  end
  results.sort 
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Write a method that returns the next to last word in the string passed to it as an argument.
# words are any sequence of non-blank characters
# assume that the input String will always contain at least 2 words

# use split to break on the words
# use [] to access the second to last sub-string

def penultimate(str)
  str.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

# write a method that returieves the middle word of a phrase.
# What edge cases need to be considered?  
# 1. empty string - should return empty string 
# 2. odd string - should warn and then return the left hand middle phrase

# split the string into an array
# find the length of the array
# if the length is even
#   chose index divide the length by 2 and use - the length - result - 1 divid the length of the array by 2
#   result - length - 1
# if the length is odd
#  divide the length by 2 and multiply by -1
# access the string by the above index

def penultimatev2(str)
  return '' if str.empty?
  phrase = str.split
  size = phrase.length 
  if size.even?
    phrase[(size / 2) - size - 1]
  else
    phrase[-size / 2]
  end
end


p penultimatev2('') == ''
p penultimatev2('I love hot donuts') == 'love'
p penultimatev2('I love hotdogs and donuts') == 'hotdogs'