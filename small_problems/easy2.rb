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
puts "The tip is $#{total_tip}"

total_bill = total_tip + bill
puts "The total is $#{total_bill}"





