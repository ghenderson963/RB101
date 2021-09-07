require 'pry'

# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a string that 
# represents that angle in degrees, minutes, and seconds.  
# use a degree symbol to represent degrees
# a single quote to represent minutes
# a double quote to represent seconds
# degree has 60 minutes and a minute has 60 seconds
DEGREE = "\xC2\xB0"

# separate the float into 2 numbers
# the first number becomes the degrees
# the second number is multiplied by 60
# repeat


# def get_number(flt)
#   arr = []
#   if [0, 360].include?(flt)
#     return [0,0,0]
#   else
#     3.times do 
#       first, second = flt.to_s.split('.')
#       second = '.'.concat(second).to_f
#       arr << first.to_f
#       flt = second * 60
#     end
#   end
#   arr
# end

# def dms(flt)
#   arr = get_number(flt)
#   format("%.2d",arr[0]) + "#{DEGREE}" + format("%.2d",arr[1]) + %Q(') + format("%.2d",arr[2]) + %(")
# end

  # take the right half and convert to a float and multiple by 60
  # split the new number and store the left half
  # take the second half and multiple by 60
  # store the left half
  # return the 3 numbers and format.
  # 

# 76.73 = 76 and 73
# store 76 in array
# .73 * 60 = 43.80
# store 43 in array
# .80 * 60 = 48
# store 48 in array


# working on a better method that is easier to read and understand
# the above fails if there is no decimal
# find the total seconds 
# 360 minutes in a degree
# 60 minutes in a second 
# The first part of the number becomes the degrees
# multiply the second part by 60 
# the first part becomes the minutes
# multiple the second part by 60 to get the seconds
# so
# 
SECONDS_PER_MINUTE = 60
def dms(flt)
  degrees, minutes = flt.divmod(1)
  minutes *= SECONDS_PER_MINUTE
  _,seconds = minutes.divmod(1)
  seconds *= SECONDS_PER_MINUTE

  format(%(#{degrees}#{DEGREE}%02d'%02d"),minutes, seconds)
end


puts dms(30) #== %(30°00'00")  # 30 = 30 00 00
puts dms(76.73) #== %(76°43'48") #76 degrees + 0.73 degrees * 60 = 43.8 = 76 degrees 43.8 minutes x 60 = 48 == 76degrees 43 minutes 48 seconds 
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")

# modify the code above so it can handle degrees above 360 correctly.
# 
# divide the original number by 360
# keep the remainder
# 

dms(400) == %(40°00'00")
dms(-40) == %(320°00'00")
dms(-420) == %(300°00'00")