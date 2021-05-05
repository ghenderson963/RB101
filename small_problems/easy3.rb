# Write a program that solicits 6 numbers from the user, then prints a message that describes
# whether or not the 6th number appears amongst the first 5 numbers.
#
# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].# 

# ask the user for an integer.  can be positive or negative.
# check that the input is an integer
# if the input is an integer add it to an array
# When you get to the sixth number check to see if the array includes the last number.

numbers = []
num = ''
ORDINALS = ['1st', '2nd', '3rd', '4th', '5th', 'last']

def integer?(input)
  input.to_s == input.to_i.to_s
end

def to_ordinal(int)
  ORDINALS.fetch(int)
end

6.times do |iteration|

  loop do
    puts "Enter the #{to_ordinal(iteration)} number: "
    num = gets.chomp
    break if integer?(num)
    puts "Please enter an integer.  Try again."
  end

  numbers << num.to_i
end

last = numbers.pop
puts "The number #{last} appears in #{numbers}" if numbers.include?(last)
puts "The number #{last} does not appear in #{numbers}." if !numbers.include?(last)

numbers.include?(num)
  
