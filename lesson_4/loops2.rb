#1. Write a loop that prints numbers 1-5 and whether the number is even or odd. 
count = 1

loop do
  puts "#{count} is odd." if count.odd?
  puts "#{count} is even." if count.even?
  break if count > 5
  count += 1
end

# 2. Modify the following code so that the loop stops if number is equal to or between 0 and 10.
loop do
  number = rand(100)
  puts number
  break if number >= 0 && number <= 10
end

#3. Use an if/else statement to print the loops.
process_the_loop = [true, false].sample
loop do 
  if process_the_loop
    puts "The loop was processed."
  else
    puts "The loop wasn't processed."
  end
  break
end

# 4. Modify the code below so that "that's correct!" is printed and the loop stops when the answer = 4.
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  break if answer == 4
end

# 5. Modify the code below so that the user's input gets added to the numbers array.  Stop the loop when the array contains 
# 5 numbers.
numbers = []

loop do
  break if numbers.size >= 5
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input 
end
puts numbers

# 6. Given the array below use loop to remove and print each name.  Stop the loop once names doesn't contain 
# any more elements.
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts "#{names.pop}"
  break if names.empty?
end

# 7. Modify the code below so that it prints the current number and stops iterating when the current number equals 2.
5.times do |index|
  puts index
  break if index >= 2
end

# 8. Using next, modify the code below so that it only prints even numbers.
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

# 9. Use next to modify the code so that the loop iterates until either number_a or number_b equals 5.
# print "5 was reached!" before breaking out of the loop.
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5
  puts "Five was reached!"
  break
end

# 10 Using the code below use a while loop to print 'Hello!' twice.
def greeting
  puts 'Hello!'
end

number_of_greetings = 2
while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
