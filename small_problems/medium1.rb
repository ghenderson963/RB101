require 'pry'
# Write a method that rotates an array by moving the first element to the end of the array
# The original array should not be modified.
# do not use Array#rotate or Array#rotate!

# [7, 3, 5, 2, 9, 1] => [3, 5, 2, 9, 1, 7]
# split the array into 2 parts 
#  1 the part that is going to end
#  2 the part that is moving up
# first = arr[-length..-1]   this would make more sense as arr[1..-1]
# second = arr[0]

# Put the 2 arrays together
#  first + second


def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true


# Write a method that can rotate the last n digits of a number.
# Rotating just 1 digits results in the original number being returned.
# n will always be positive

# convert the int into an array
# split the array between 
# 1 the part that doesn't change arr[0..num]
# 2 the part that does change   arr[-num..-1]
# take the part that changes and send it to rotate_array
# put the 2 parts back together 
# return an integer

def rotate_rightmost_digits(int, num)
  arr = int.to_s.chars
  arr[-num..-1] = rotate_array(arr[-num..-1])
  arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917


# Write a method that takes an integer as argument, and returns the maximum rotation of that
# argument.
# don't have to handle 00s


# convert the string arguement to an array and assign the arra to a variable.
# subtract 1 from the arrays length and assign it to a variable
# initialize a counter variable
# create a loop
# assign the back elements of the array a variable
# send the back elements and the loop counter to the rotate_rightmost_digits
# place the results of rotate_rightmost_digits to front of number.
# stop when counter >= to length
# return the converted array as an integer

# 1st rotation 735291 -> 352917 first rotation is move the first digit to the end and the rest down what the rotate_right...does
# 2nd rotation 352917 -> 329175 now keep the first digit in place and rotate 1. send 52917 arr[-1..-num] 1
# 3rd rotation 329175 -> 321759 first 2 digits in place and rotate 2
# 4th rotation 321759 -> 321597 first 3 in place and rotate 
# your shrinking the part you are sending to rotate each time
# rotate_rightmost_digit(int, number to rotate)
# you send the whole number it won't touch the blocked number if you send the right number
# start at length -> length - 1 -> length - 2



# arr[-1..-num] = rotate_rightmost_digits(arr[-num..-1],counter)
# stop when num >= length
# convert back to in

# first capture the back n digits
# 2. move the x digit to the end
# 3. 

def max_rotation(int) 
  counter = int.to_s.length
  result = 0

  loop do
     result = rotate_rightmost_digits(int, counter)
     counter -= 1
     # binding.pry
     break if counter == 2
  end
  result
end


# p max_rotation(735291) #== 321579
# p max_rotation(3) #== 3
# p max_rotation(35) #== 53
# p max_rotation(105) #== 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) #== 7_321_609_845


# Write a method that takes one argument, the total number os switches, and returns an Array
# that identifies which lights are on after n repetitions.
# Example with n= 5 lights:
# round 1: every light is turned on
# round 2: lights 2 and 4 are now off; 1,3,5 are on
# round 3: lights 2,3 and 4 are now off; 1 and 5 are on
# round 4: lights 2 and 3 are now off; 1,4 and 5 are on
# round 5; lights 2,3, and 5 are off; 1 and 4 are on
# 1. on, on, on, on, on  - all
# 2. on, off,on,off,on   - 2,4,6,8
# 3. on, off, off,off,on - 3,6,9,12
# 4. on,off,off,on,on    - 4, 8
# 5. on,off,off,on,off   - 5, 9

# number_to_jump = the number you skip
# hash maybe an array  hsh = { 1: 'on', 2: 'off', 3, 'on'} or ['on','on','on','on']
# so you would want to loop through the number of digits
# at each iteration if the number is divisible by the number_to_jump toggle it
# if not skip it
# counter = 1
# loop do 
#   break if counter >= n
#   arr[counter] == 'off' ? arr[counter] = 'on' : arr[counter] = 'off'
#   counter += 1
# end
#
# 1. iterate of the number give maybe 1.upto(num)
# 2. taking the number 
# 3. use the number to move through the array adding num to itself each time
# 4. start at num and add num to itself until you are reach the end of the array
# 4. toggle the swithch on each number 
# 5. done with inner loop
# 6. toggle the next number and move through the array

# 1. initialize a hsh with everything turned to off
# 2. load the hash with all of the switch
# 2. set up a loop that starts at 1 and goes up to the integer given

#    traverse the hsh by the number given
#     
# 3. 
# 4. create an inner loop which breaks when the variable above reaches the given arguement
# 5. inner array - each iteration take the number from the outer array
# 6.   toogle the light hsh[num] == 'on' ? 'off' : 'on'
# 7    iterate the inner_number by adding num = num + num
# 8.  break when num >= given number
# 9. after going through all the numbers return an array with only the on lights
# 10.  iterate through the array and only select the numbers that are 'on'


def lights(number_of_lights)
  lights = {}
  loop_number = 1

  loop do
    light = 0

    loop do
      light = light + loop_number
      break if light > number_of_lights

      if lights[light].nil?
        lights[light] = 'on'
      else
        lights[light] == 'off' ? lights[light] = 'on' : lights[light] = 'off'
      end 
    end

    loop_number += 1
    break if loop_number > number_of_lights
  end
    lights.select { |_k, v| v == 'on' }.keys 
end

p lights(5)
p lights(10)
p lights(1000)

# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is 
# supplied as an arguement to the method.
# Assume that the argument will always be an odd integer.
# 
# first one goes at num / 2 + 1 and is only 1
# second on goes at half way -1 and + 1 is 3
# third one goes at half way - 2 and + 2 is 5
# fourth - halfway - 3  and + 3 is 7
# half_way = n / 2 + 1 
# 4 spaces + 1 * + 4 spaces
# 3 spaces + 3 * + 3 spaces
# 2 spaces + 5 * + 2 spaces
# 1 space +  7 * + 1 space
# 9 *

def display(number_of_spaces, number_of_ast)
  number_of_spaces.times { print ' ' }
  number_of_ast.times { print '*' }
  number_of_spaces.times { print ' ' }
  puts
end

def diamond(num)
  number_of_ast = 1
  number_of_spaces = num / 2 + 1

  loop do
    display(number_of_spaces, number_of_ast)
    break if number_of_ast >= num
    number_of_ast += 2
    number_of_spaces -= 1
  end

  loop do 
    number_of_ast -= 2
    number_of_spaces += 1
    display(number_of_spaces, number_of_ast)
    break if number_of_ast <= 0
  end
  puts

end

diamond(1)
diamond(3)
diamond(9)

# Write a method that implements a miniature stack-and-register-based programming language that has the
# following commands:
# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

# use and array and push and pop methods
# stack = array
# register = probably a variable int

# 1. divide the argument string on spaces
# 2. iterate through the sub-string arguments
# 3.   check if the arguement is a int
#        if the argument is a number 
#           push it onto the register
#        else
#           perform the operation
#

def compute(stack, register, command)

  case command
  when 'PUSH'   then return register if stack.push(register)
  when 'ADD'    then register + stack.pop
  when 'SUB'    then register - stack.pop
  when 'MULT'   then register * stack.pop
  when 'DIV'    then register / stack.pop
  when 'MOD'    then register % stack.pop
  when 'POP'    then stack.pop
  when 'PRINT'  then p register
  else
    puts 'ERROR: #{command} command.'
  end
end


def minilang(input)
  stack = []
  register = 0
 
input.split.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    else
      register = compute(stack, register, command)
    end
  end

end

# minilang('3 4 ADD')
minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

# Write a method that takes a sentence string as input, and returns the same string with any sequence of the 
# words 'zero', 'one', 'two','three','four','five''six''seven','eight','nine' converted to string of digits.

# need to convert strings to numbers 'one' => 1
# thinking hash my be a good idea for dictionary
# input string
# output string
# check each word in the phrase to see if it is a number
# if it is a number 
#   convert it to a digit and replace it
# else
#   leave it in the array
# 
# need to iterate through each word to pull out punctuation
# each iteration 
#   partition any punctuation into a seperate element
# 
# 
#  1. remove punc
#  2. if it is a digit
#    2.1. convert it
#    2.2. add the puc
#  3. else return itself


def word_to_digit(phrase)
  digits = %w(one two three four five six seven eight nine)

  phrase.split.map do |word|
    new_word, punc = word.chars.partition { |char| char.match(/[a-zA-Z]/) }
    new_word = new_word.join
    if digits.include?(new_word)
      (digits.index(new_word) + 1).to_s + punc.join
    else
      word
    end
  end.join(' ')

end

def word_to_digitv2(phrase)
  digits = %w(one two three four five six seven eight nine)

  digits.each do |digit| 
    phrase.gsub!(/\b#{digit}\b/, (digits.index(digit) + 1).to_s)
  end
  phrase
end


p word_to_digitv2('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
# f(n) = f(n - 1) + f(n-2)
# f(5) = f(5 - 1) + f(5 -2)
#            4 + 3 
# 0,1,1,2,3,5,8,13,21,34
# 1st 1 + 0 =                                               1         1
# 2nd 0 + 1 = 1 result = previous_result + result     last_result = result     
# 3rd 1 + 1 = 2 result = last_result + result         2last_result = result
# 4th 1 + 2 = 3 result = last_result + result          last_result = result
# 5th 2 + 3 = 5 result = last_result + result 
# 6th 3 + 5 = 8
# 
# sum + next_num = sum 
#
# want to loop 6 times for the 6th which is 8
# number + next_num = fib_num
# number = fib_num
#  loop through until you reach the original number
# 1 st = 1
# sum = 1
# fib = first + 0
# fib = fib + 1
# fib = fib + 2
# fib = fib + 3
#   each iteration add 1 to n

def fibonacci(n)
 return 1 if n <= 2
 fibonacci(n - 1) + fibonacci(n - 2)
end



p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765

# Rewrite the above method without recursion
# 1,1,2,3,5,8,13,21
# 1 + 1 = 2
# 1 + 2 = 3 result = result + previous_result
# 3 + 2 = 5
# 5 + 3 = 8

# create a variable to store the integer result
# create a variable to store the last result
# create a variable to store the new result
# if the number passed in is 1 return 1
#  new_result = last_result + result
#  last_result = result
#  result = new_result

#  

def fibonacciv2(num)
result = 1
last_result = 0
new_result = 0

return 1 if num <= 1
  2.upto(num) do
    new_result = result + last_result
    last_result = result
    result = new_result
  end
  
  result
end

p fibonacciv2(20) == 6765
p fibonacciv2(100) == 354224848179261915075
# p fibonacciv2(100_001) # => 4202692702.....8285979669707537501

def fibonacciv3(num)
  last, result = [1, 0]
  
  2.upto(num) do
    result, last = [last, result + last]
  end

  last

end

p fibonacciv3(20) #== 6765
p fibonacciv3(100) #== 354224848179261915075

# write a method that returns the last digit of the nth Fibonacci number
# 

def fibonacci_last(num)
  result = fibonacciv3(num)
  result.to_s[-1].to_i
end

def fibonacci_lastv2(num)    # speed this up to grab the last test
  last_2 = [0, 1]

  2.upto(num) do 
    last_2 = [last_2.last, (last_2.first + last_2.last) % 10]
  end

  last_2.last
end



p fibonacci_lastv2(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_lastv2(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_lastv2(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_lastv2(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_lastv2(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_lastv2(123456789) # -> 4