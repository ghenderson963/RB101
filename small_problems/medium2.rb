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

  sentences = File.read("./longest_sentence.txt").split
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



  