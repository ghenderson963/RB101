# 1. What will happen to the greating variable in the code below.
if false
    greeting = "hello world"
  end
  
  greeting

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: array of strings
# 1. What is a substring.  
# 2. empty string returns empty array
# 3. leave any caps the same only add caps to the full palindrom
# 4. assume all inputs will be strings
# 5. what does it mean to treat palindrome words case sensitive

# rules:
# 1. return only strings that are palindromes
# 2. empty string returns empty string
# 3. palidromes must have the same case.

halo - ha, hal, halo, al, alo, lo 
slice[0,2]
slice[0,3]
slice[0,4] 
i and j when j == string.length
slice[1,2]
slice[1,3]   j >= string.length
slice[2,3]   j >= string.length

2 loops 1 inner and 1 outer
i = 0
j = 2
result = []
loop do
    
  loop do
    temp = ''
    break if j >= str.length
    temp = str[i,j]
    result << if is_palindrome?(temp)
    i += 1
  end

  

loop do
  loop do
    
