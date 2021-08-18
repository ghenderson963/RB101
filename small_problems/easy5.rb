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

def find_hours_minutes(minutes)
  hh, mm = minutes.divmod(60)
end

def format_time(hh, mm)
  format('%02d:',hh) + format('%02d',mm)
end

def time_of_day(minutes)
  _, minutes = remove_extra_days(minutes)
  hh, mm = find_hours_minutes(minutes)
  format_time(hh, mm)
end


p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57" # 24 - 1 = 23  60 - 3 = 57
p time_of_day(35) == "00:35" #24 + 1 = 0   35  - if before midnight starts at 00 
p time_of_day(-1437) #== "00:03"
p time_of_day(3000) #== "02:00"
p time_of_day(800) == "13:20" #800/60 
p time_of_day(-4231) #== "01:29"   #4231 / 1440 = 2 and 1351 1440 - 1351 = 89.divmod(60)
p time_of_day(-60)
p time_of_day(60)


# Write 2 methods that each take a time of day in hour format, and return the number of minutes before and 
# after midnight.
# Both methods should return a value in the range 0..1439
# Don't use ruby's Time and Date methods

# break the string into 2 substrings on the :

# normalize_to_minutes
# # if the total hours * 60 is greater than 1443 divide the total by 60 keep the remainder as hours
# take the hours and multiply them by 60

# after_midnight
# add the minutes to get the total minutes after midnight

# before_midnight
# subtract the minutes to get the total before midnight
def hours_minutes(time)
  time.split(':')
end

def normalize_to_minutes(hh, mm)
  if hh.to_i * 60 == 1440
    [0,0]
  elsif hh.to_i * 60 >= 1439
    [0,mm]
  else
    [hh, mm]
  end
end

def after_midnight(time)
  hh, mm = hours_minutes(time)
  hh, mm = normalize_to_minutes(hh, mm)
  minutes = hh.to_i * 60 + mm.to_i
end

def before_midnight(time)
  hh, mm = hours_minutes(time)
  hh, mm = normalize_to_minutes(hh, mm)
  minutes = hh.to_i * 60 - mm.to_i
end

p after_midnight('00:00') #== 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754  
p before_midnight('12:34') == 686
p after_midnight('24:00') #== 0
p before_midnight('24:00') #== 0

# Given a string of words separated by spaces, write a method that takes this string
# of words and returns a string in which the first and last letters of every word are swapped
# every word contains at least 1 letter.
# string will always contain at least one word,
# each string contains nothing but words and spaces.

# take the string and break it into words (sub-strings)
# iterate through the sub-strings
# swap the first and the last character on every sub-string
# put the longer phrase back together

def swap(phrase)
  altered = phrase.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end
  altered.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'