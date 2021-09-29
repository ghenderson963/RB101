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

def staggered_case(phrase)
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

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

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


def staggered_casev1(phrase)
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

#
