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
  year % 400 == 0 || year % 100 != 0 && year % 4 == 0
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

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

