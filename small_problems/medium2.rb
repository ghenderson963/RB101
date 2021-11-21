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

sentences = File.read("./Frankenstien.txt").split
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
  pre_blocks = "B:O   X:K   D:Q   C:P   N:A
   G:T   R:E   F:S   J:W   H:U
   V:I   L:Y   Z:M"
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
  p counts
  !counts.values.any? { |count| count > 1 }
end


# store as a nested array
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true



  