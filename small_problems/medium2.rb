  require 'pry'

  # Write a program that reads the content of a text file and then prints the longest sentence in the file
  # based on number of words.
  # Sentences can end with . ! ?
  # any sequence of characters that are not spaces or sentence-ending characters is a word
  # print the number of words in the longest sentence.

  # 1. Read in the text file
  # 2. iterate through the string counting words as you go along.
  # 3. when you get to a . ! or ? stop
  #    create a loop
  #      count the words until you hit punctuation
  #      use the counter to count 
  #      when you hit a punctuation start over by setting count to zero
  #    if word is a word count it and push to temp arr
  #    if word is a punctuation
  #      compare the length of temp array to longest_sentence_count
  #      if bigger save it and copy temp_array over longest_sentence
  #      if smaller do nothing
  #      reset counter and longest_sentence start again

  # use each to iterate through each string
  #  if the last element of the string is a . ! or ?
  #    if temp_array is longer than longest array
  #      longest_array = temp_array
  #    else
  #      add word to temp_array
  #    end
  #    compare the length of temp_array to the length of longest_array
  #    


  # 4. see if the latest count is longer than the previous count
  # 5. if it is longer save the sentence and the count
  
  
  # 5. print the number of words in the longest sentence
  # 6. print the longest sentence

sentences = File.read("./sentences.txt").split
longest_sentence = []
temp_array = []

sentences.each do |word|
  temp_array << word
  if ['.', '!', '?'].include?(word[-1])
    longest_sentence = temp_array if temp_array.length > longest_sentence.length
    temp_array = []
  end
end

p longest_sentence.join(' ')
p longest_sentence.length



# Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks
# false otherwise.

# take the word passed in and pass each letter to the blocks arr
#   iterate through the blocks array 
#     check if the letter matches one of the letters
#     if it does match put a 1 in the value of the hash
#     if it doesn't match move to the next pair
#     once you've gone through the blocks array
#     check if any value of the hash is greater than 1
#     if it is greater than 1 return false
#     if it is not greater than 1 return true

# split the string argument into letter substrings and assign it to a variable
# iterate through the substrings
#   1. see if the letter is included in any of the keys.
#   2. if it is included in add 1 to the value of that key
#   3. 
def get_counts
  pre_blocks = "B:O   X:K   D:Q   
   C:P   N:A    G:T   R:E   F:S
   J:W   H:U    V:I   L:Y   Z:M"
   blocks = pre_blocks.split(' ').map { |pair| pair.delete(':') }
   blocks.each_with_object({}) { |pair, counts| counts[pair] = 0 }
end

def block_word?(word)
  counts = get_counts
  word.chars.each do |letter|
    counts.each do |block,v_|
      counts[block] += 1 if block.include?(letter.upcase)
    end
  end

  !counts.values.any? { |count| count > 1 }
end

# store as a nested array
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

  def block_wordv2?(word)
    str = word.upcase
    BLOCKS.none? { |block| str.count(block) > 1 }
  end

p block_wordv2?('BATCH') #== true
p block_wordv2?('BUTCH') == false
p block_wordv2?('jest') == true


# Write a method that takes a string and returns a hash that contains 3
# 1 the percentage of characters in the string that are lowercase
# 2 the percentage of characters that are uppercase
# 3 characters that are neither 
# each string will contain at least 1 character

# percentage is num / total number * 100
# count the lowercase letters and then find percentage of total
# count the uppercase letters and then find percentage of total
# count numbers spaces and punc and find percentage of total

# initialize a hash that has the correct keys with percentage = 0
# initalize a variable for lowercase
# initalize a variable for uppercase
# intialize a variable for other
# initialize a variable and set the total to the length of the total string
# lowercase = (str.count('a-z') / total_characters * 100).rount(1)
# uppercase = (str.count('A-Z') / total_characters * 100).round(1)
# other = (str.count('^a-zA-Z) / total_characters * 100).rount(1)

def letter_percentages(str)
  results = {lowercase: 0, uppercase: 0, neither: 0 }
  total_characters = str.length
  results[:lowercase] = (str.count('a-z').to_f / total_characters.to_f * 100).round(1)
  results[:uppercase] = (str.count('A-Z').to_f / total_characters.to_f * 100).round(1)
  results[:neither] = (str.count('^a-zA-Z').to_f / total_characters.to_f * 100).round(1)
  results
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }


# Write a method that takes a string as an argument, and returns true if all 
# parentheses in the string are properly balanced, false otherwise.
# Parentheses must occur in matchig '(' and ')' pairs.

# need to find a '(' then find a ')'
# The number of '(' needs to match the number of ')'
# str.count('(') == str.count(')')
# will be false if ')' occurs before '('
# will be false if '(' occurs without another ')'

# count the number of '(' and ')' 
# for every '(' + 1 for every ')' -1
# break out if the total goes below 0 because it means you have a unbalanced phrase
# 
# iterate through the characters of the str
# when you find a '(' count + 1
# when you find a ')' count - 1
# break if count goes below 0
# return false if the count isn't 0

# initialize a variable to track the count
# iterate through the characters of the string
#   if character = '(' add 1
#   if character = ')' subtract 1
#   check if count below zero and break if it is
# check that count == zero

def balanced?(str)
  count = 0
  str.chars.each do |letter|
    count += 1 if ['(','[','{'].include?(letter)
    count -= 1 if [')',']','}'].include?(letter)
    break if count < 0
  end
  count.zero?
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('Gary is t)(he be()st') == false


# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
# depending on whether the triangle is equilateral, isoceles, scalene, or invalid.

# equilateral - all 3 sides are of equal length
# isosceles - 2 sides are of equal length and a 3rd is different
# scalene - all 3 sides are of different length
# invalid - sum of the lengths of the 2 shortest sides must be greater than
#           the length of the longest side.
#           lengths must be greater than 0

# Check for invalid
#   is the sum of the lengths of the 2 shortest sides longer than the longest side
# check for equilateral
# check isosceles
# check scalene



triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid
