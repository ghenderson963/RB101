# 1. Runaway Loop
# Modify the code below so the loop stops after the first iteration.
loop do
  puts 'Just keep printing....'
  break
end

# 2. Modify the code below so each loop stops after the first iteration.
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

# 3. Modify the code below so it iterates 5 times instead of just once.
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# 4 Modify the code below so the loop stops iterating when the user inputs 'yes'.
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer.downcase == 'yes'
end

# 5. Modify the code below so "Hello!" is printed 5 times.
say_hello = true
counter = 1

while say_hello
  puts 'Hello!'
  say_hello = false if counter == 5
  counter += 1
end

# 6. Using a while loop print 5 random numbers between 0 and 99.
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

# 6. Modify the code below so that it counts from 1 to 10.
count = 1

until count > 10
  puts count
  count += 1
end

# 7. Given the array of numbers below, use an until loop to print each number.
numbers = [7, 9, 13, 25, 18]

until numbers.empty?
  puts "#{numbers.shift}"
end

# 8. Modify the code below so that it only outputs i if i is an odd number
for i in 1..100
  puts i if i.odd?
end

# 9. Use a for loop to greet each friend individually.
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello #{friend}!"
end
