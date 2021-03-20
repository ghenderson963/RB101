require 'pry'
# Build a command line calculator program that does the following
# - asks for 2 numbers
# - asks for the type of operation to perform: add, subtract, multiply or divide
# - diplays the result
play_again = 'y'
answer = 'n'
num1 = nil
num2 = nil
while play_again == 'y'

  loop do
    puts "Enter the first number."
    num1 = gets.chomp
    break if num1 == num1.to_i.to_s
  end

  loop do
    puts "Enter the second number."
    num2 = gets.chomp
    break if num2 == num2.to_i.to_s
  end

  loop do
    puts "Would you like to (a)dd, (s)ubtract, (m)ultiply or (d)ivide?"
    answer = gets.chomp.downcase
    break if answer == 'a' || answer == 's' || answer == 'm' || answer == 'd'
  end

  def add(num1, num2)
    num1.to_i + num2.to_i
  end

  def subtract(num1, num2)
    num1.to_i - num2.to_i
  end

  def multiply(num1, num2)
    num1.to_i * num2.to_i
  end

  def divide(num1, num2)
    if num2.to_i == 0
      "Can't divide by 0"
    else
      num1.to_f / num2.to_f
    end
  end

  case answer
  when 'a'
    puts "#{num1} + #{num2} = #{add(num1, num2)}"
  when 's'
    puts "#{num1} - #{num2} = #{subtract(num1, num2)}"
  when 'm'
    puts "#{num1} * #{num2} = #{multiply(num1, num2)}"
  else
    if num2.to_i == 0
      puts "Can't divide by zero."
    else
      puts "#{num1} / #{num2} = #{divide(num1, num2)}"
    end
  end

  puts "Calculate more numbers? (y)es or (n)o?"
  play_again = gets.chomp.downcase

end
