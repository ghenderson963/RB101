require 'date'

# Build a program that randomly generates and prints Teddy's age.  To get the age, you should generate
# a random number between 20 and 200

puts "Teddy is #{rand(20..200)} years old!"

def how_old(name = "Teddy")
  puts "#{name} is #{rand(20..200)} years old!"
end

puts "What is the name?"
name = gets.chomp
if name == ''
  how_old
else
  how_old(name)
end

# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room
# in both square meters and square feet.
# 1 square meter == 10.7639 square feet
# do not validate input
# 
# - ask the user for the length and width
# - store the input in variables

puts "Enter the length of the room in meters:"
length = gets.chomp.to_f
puts "Enter the width of the room in meters:"
width = gets.chomp.to_f
square_feet = (length * width * 10.7639)
puts "The area of the room is #{length * width} square meters (#{square_feet.round(2)} square feet)."

# Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.  The program must
# compute the tip and then display both the tip and total amount of the bill.
# 
print "What is the bill? "
bill = gets.chomp.to_f
print "What is the tip percentage? "
tip = gets.chomp.to_f

total_tip = bill * tip * 0.01
puts "The tip is $#{format("%.02f",total_tip)}"

total_bill = total_tip + bill
puts "The total is $#{format("%.02f",total_bill)}"

# Build a program that displays when the user will retire and how many years she has to work until retirement.
# - ask for her age
# - ask for when she would like to retire
# - calculate the years until retirement.
# -   years until retirement = when retire - current age
# - print the years until retirement
# - I'm 50 and I want to retire at 60
# - 60-50 = 10 years
# - this years date + years until retire 

print "What is your age? "
current_age = gets.chomp.to_i 

print "At what age would you like to retire? "
age_at_retirement = gets.chomp.to_i

years_until_retirement = age_at_retirement - current_age
current_year = DateTime.now.year
date_of_retirement = current_year + years_until_retirement

puts "It's #{current_year}.  You will retire in #{date_of_retirement}."
puts "You have only #{years_until_retirement} years of work to go!"

# Write a program that will ask for user's name.  The program will then greet the user.  If the user writes "name!" then the computer
# yells back to the user.

# - Ask for the users name.
# - check if the name includes '!'
# - if it does include '!' print "HHHHHH"
# - else
# - print hello and the name

print "What is your name? "
name = gets.chomp

if name.include?('!')
  puts "HELLO #{name.upcase}.  WHY ARE WE SCREAMING?" 
else
  puts "Hello #{name}."
end

# Print all odd numbers from 1 to 99, inclusive to the console with each number on a separate line.
(1..99).each { |num| puts num if num.odd? }









