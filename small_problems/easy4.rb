# Write a method that takes 2 strings as arguments, determines the longest of the 2 strings
# and then returns the result of concatenating the shorter string the longer string and 
# the shorter string once again.  
# strings will always be different lengths

# find the longer of the 2 strings
# concate the shorter string to the longer string
# concate the shorter to the end of the string
# short + long + short

# if the first string is longer
# then take the second string and concat
# if the second string is longer 
# then take the first string and concat
# add the short string to the string

def short_long_short(str1, str2)
  return str1 + str2 + str1 if str1.length < str2.length
  return str2 + str1 + str2 if str2.length < str1.length
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# Write a method that takes a year as input and returns the century.  The return value
# should be a string that begins with the century number, and ends with st, nd, rd, or th as 
# appropriate

# 1971 => 20th
# Could we use the 100rds place

# problem 1
# figure out how to get the numeral part
#  divide the year by 100 to get the century
#  add 1 to it unless the divisor == 0
# figure out how to tack on the ending
#  st, nd, rd, or th
# 1st, 2nd, 3rd, 21st, 22nd, 23rd,,,,
# if its a 1,2,3,4 for the ones place except 11,12,13

# build an array that contains those numbers and test
# if it is under 20 and greater than 10 add st, nd, rd to 1,2,3

# take the number and divide it by

def find_century(year)
  century, era = year.divmod(100)
  era == 0 ? century : century + 1
end

def add_suffix(base_century)
  tens, ones = base_century.divmod(10)
  return base_century.to_s + 'th' if [11, 12, 13].include?(base_century % 100)
  suffix = case ones
           when 1
             'st'
           when 2
             'nd'
           when 3
             'rd'
           else 
             'th'
           end
  base_century.to_s + suffix
end

def century(year)
  add_suffix(find_century(year))
end

p century(2000) == '20th' # on the zero stays
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052)  == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# Write a method that takes any year greater than 0 as input and returns true
# if the year is a leap year or false if it is not a leap year.

# Leap year - Gregorian Calendar, leap years occur in every year that is evenly
#                                 divisible by 400 year % 100 == 0 
#                                 Unless the year is also divisible by 100 then it is not
#                                 Unless it is also divisible by 400

def leap_year?(year)
  if year <= 1752
    year % 4 == 0
  else
    year % 400 == 0 || year % 100 != 0 && year % 4 == 0
  end
end

puts ' '
p leap_year?(2016) == true  # 2016 % 4 == 0 and 2016 % 100 != 0
p leap_year?(2015) == false # 2015 % 4 != 0 false
p leap_year?(2100) == false # 2100 % 4 == 0 and 2100 % 100 == 0 and 2100 != 400 false
p leap_year?(2400) #== true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# if evenly divisible by 4 && not evenly divisible by 100 == true
# if evenly divisible by 100 check and see if evenly divisible by 400 == true
# else false

# return true if num evenly divisible by 4 && num not evenly divisible by 100
# return true if num not evenly divisible by 100 and is evenly divisible by 400
# else return false

# Update the method above to determine leap years both before and after 1752.
# the Julian Calendar was used before 1752 and leap years occur in any calendar
# divisible by 4

# if year is before 1752 then if it is divisible by 4 is leap year
#
puts ''
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true


# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other
# number and then computes the sum of those multiples.

# Is integer and greater than 1

def multisum(num)
  (1..num).to_a.inject(0) { |sum,num| (num % 3 == 0 || num % 5 == 0) ? sum += num : sum }

  # total = 0
  # 1.upto(num) do |num|
    # if num % 3 == 0 || num % 5 == 0
      # total += num
    # end
  # end
    # total
end

puts ' '
p multisum(3) == 3
p multisum(5) == 8 # 3 + 5 = 8
p multisum(10) == 33 # 3 + 5 + 6 + 9 + 10 = 33
p multisum(1000) == 234168 

# start at 1 and count up by 1
# check if each sum is divisible by 3 or 5
# if it is add it to the sum
# else next number
# return the summed number

#  Write a method that takes an array of numbers and returns an array with the same number of elements
# and each element has the running total from the original array.
# input: array of numbers integers?
# output: array with same number of elements

# iterate through the array
# keep a running sum of all the elements
#   initialize a variable sum
#   add the current element to the sum
# the next element becomes the sum of the previous elements

def running_total(arr)
  sum = 0
  # arr.map { |num| sum += num }
  arr.inject([]) { |arr1, num| arr1 << sum += num }
end


puts ''
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

require 'pry'
# Write a method that takes a String of digits, and returns the appropriate
# number as an integer.  
# do not worry about leading + or - signs, nor should you worry about invalid
# characters.

# break the string up into sub-strings.
# start on the left and look up the value of the single string digit
# multiply the integer returned by the number of characters times 10 to the integer - 1 
# sum the numbers until you have the integer version.
# 
# 
LETTERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def letter_to_integer(letter)
  #binding.pry
  LETTERS.index(letter)
end

def string_to_integer(str)
  convert = str.chars.map { |str| LETTERS.index(str) }

  total = 0 
  convert.each { |num| total = 10 * total + num }
  total
  # counter = 0
  # loop do
    # break if counter >= str.length
    # result += letter_to_integer(str[counter]) * (10 ** (str.length - counter - 1))
    # counter += 1
  # end
  # result
end

puts ''
p string_to_integer('4321') #== 4321 # 4000 + 300 + 20 + 1 = 4321
p string_to_integer('570') == 570

# Write a method that converts integers to hexadecimal

# Take decimal number as dividend. Divide this number by 16 
# (16 is base of hexadecimal so divisor here). Store the 
#remainder in an array (it will be: 0 to 15 because of divisor 16,
#replace 10, 11, 12, 13, 14, 15 by A, B, C, D, E, F respectively). 
#Repeat the above two steps until the number is greater than zero.

# initialize a variable and set the passed in arguement to it
# 
# initialize a variable for the array to push the results to
# create a loop
# divide the result variable by 16 store the result and the remainder.
# if the remainder contains 10,11,12,13,14,15 int_to_letter
# push the result of the above into the array
# break the loop when division goes below 0
# join the letters and number in the result array and return



INT_TO_LETTER = {
  10 => 'A',
  11 => 'B',
  12 => 'C',
  13 => 'D',
  14 => 'E',
  15 => 'F' 
}

NUMBERS = [10, 11, 12, 13, 14, 15]

def integer_to_letter(int)
  INT_TO_LETTER[int]
end

def integer_to_hexadecimal(int)
  number = int
  result = []

  loop do 
    break if number <= 0
    number, remainder = number.divmod(16)
    if NUMBERS.include?(remainder)
      result << integer_to_letter(remainder)
    else
      result << remainder
    end
  end
  result.reverse.join 
end

puts ''

p integer_to_hexadecimal(19871) == '4D9F'

# write a method that converts from hexadecimal to integer
# Start by multipling the hex number by 16
# then raise it to the power of 0 
# increase the power by 1 each time

# Create a global array called LETTER_TO_INT
# Create a global array called STRING_TO_INT
# initialize a variable to assign the arguement to
# initialize a variable to hold the result

# break apart the hexadecimal string into sub strings
# iterate through the array of strings
# for each substring
#  convert to integer using an array of numbers
#    if it is a letter convert it to an integer using 
#  add it to the running total
# return the running total

STRING_TO_INTEGER = {
                      '1' => 1,
                      '2' => 2,
                      '3' => 3,
                      '4' => 4,
                      '5' => 5,
                      '6' => 6,
                      '7' => 7,
                      '8' => 8,
                      '9' => 9,
                      'A' => 10,
                      'B' => 11,
                      'C' => 12,
                      'D' => 13,
                      'E' => 14,
                      'F' => 15,
                      'a' => 10,
                      'b' => 11,
                      'c' => 12,
                      'd' => 13,
                      'e' => 14,
                      'f' => 15
}

def hexadecimal_to_integer(hex)
  result = 0
  counter = 0
  hex.chars.reverse.each do |digit|
    result += STRING_TO_INTEGER[digit] * (16 ** counter)
    counter += 1
  end
  result 
end

p hexadecimal_to_integer('4D9f') == 19871

# Write a method that takes a String of digits and returns the appropriate number as an integer.
# The string may have a leading + or - sign.  
# If the first character is a + the method should return a positive number
# If the first character is a - the method should return a negative number
# If no sign is given return a positive number

#
# convert the string to an array
# iterate through the array
# check if each character is a '-'
#   if it contains a '-' multiply by -1
#                   and drop the '-'
#   if it contains a '+' remove the +
# for each str convert to integer
# 

def string_to_signed_integer(str)
  if str.include?('-')
    str.delete!('-')
    -1 * string_to_integer(str)
  else
    str.delete!('+')
    string_to_integer(str)
  end
end

puts ''
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100

# Write a method that takes a positive integer or zero and converts it to a string representation

# build a hash that will convert integers to strings
# initialize a variable to store the quotient
# initialize a variable to store the array
# create a loop 
# divide the initial number
# store the remainder and the quotient in variables
# push the remainder into the hash
# use the quatient for the next iteration of the loop
# break when the loop is less than zero

INT_TO_STRING = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9'      
}

def integer_to_string(int)
  result = ''
  quotient = int
  loop do
    quotient, remainder = quotient.divmod(10)
    result.prepend(INT_TO_STRING[remainder])
    break if quotient <= 0
  end
  result
end

p integer_to_string(4321) == '4321' #
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Write a method that takes an integer, and converts it to a string representation

# if the first character is a '-'
#   '+' + integer_to_string(int)
# else
#   '-' + interger_to_string(int)
#

def signed_integer_to_string(int)
  if int < 0
    int *= -1
    '-' + integer_to_string(int)
  elsif int > 0
    '+' + integer_to_string(int)
  else
    integer_to_string(int)
  end
end


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# Write a method that determines and returns the ASCII string value of a string that is passed in as
# an argument.  
# The ASCII string value is the sum of the ASCII values of every character in the string.  use String#ord

# Iterate through the string
# convert the substrings to ord
# sum the numbers

def ascii_value(str)
  str.chars.inject(0) { |sum, char| sum += char.ord }
end


p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour
# format (hh:mm).  Needs to work with any integer input.  Don't use Date or Time classes.

## if the number is positive.
##   first remove any extra days 
##     divide the number by 1440
##     drop the quotient
##     remainder becomes the minutes
##     divide the minutes by 60
##     quotient = hh and remainder = mm

## if the number is negative
##   first remove the extra days
##    divide the number by 1440
##    drop the quotient
##    subract the mm by 1440 for the minus
##    divide the minutes by 60 hh = quotient mm = remainder
##
##   format the string to "hh:mm"


# if the number is possitive
# divide the time in minutes by 60 the quotient is the hour the remainder is the min.

# if the number is negative subtract the number from 1440 (the numbers of minutes in 24 hours)
# if the number is negative divide the number by 1440 drop the quotient and subtract the remainder from 1440
# take the sum of the above and divide it by 60 the remainder is the minutes and the quotient is the hours "hh:mm"

# remove any extra years
# if negative convert to positive
# find the minutes and hours
# format

# format the remainder and the quotient in the 'hh:mm'

def remove_extra_days(minutes)
  minutes.divmod(1440)
end

def convert_to_positive(minutes)
  return minutes *= -1 if minutes < 0
  minutes
end

def find_hours_minutes(minutes)
  hh, mm = minutes.divmod(60)
end

def format_time(hh, mm)
  format('%02d:',hh) + format('%02d',mm)
end

def time_of_day(minutes)
  _, minutes = remove_extra_days(minutes)
  minutes = convert_to_positive(minutes) if minutes < 0 
  hh, mm = find_hours_minutes(minutes)
  format_time(hh, mm)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57" # 24 - 1 = 23  60 - 3 = 57
p time_of_day(35) == "00:35" #24 + 1 = 0   35  - if before midnight starts at 00 
p time_of_day(-1437) == "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) == "13:20" #800/60 
p time_of_day(-4231) == "01:29"   #4231 / 1440 = 2 and 1351 1440 - 1351 = 89.divmod(60)
