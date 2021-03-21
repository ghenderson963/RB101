# Build a command line calculator program that does the following
# - asks for 2 numbers
# - asks for the type of operation to perform: add, subtract, multiply or divide
# - diplays the result

def prompt(message)
  puts "==> #{message}"
end

def valid_number?(num)
  num.to_i != 0
end

prompt("Welcome to calculator!")

loop do
  num1 = ''
  loop do
    prompt('Enter the first number.')
    num1 = gets.chomp
    if valid_number?(num1)
      break
    else
      prompt("That doesn't apear to be a valid number.")
    end
  end

  num2 = ''
  loop do
    prompt('Enter the second number.')
    num2 = gets.chomp
    if valid_number?(num2)
      break
    else
      prompt("That doesn't appear to be a valid number.")
    end
  end

  operator_prompt = <<-MSG
                    What type of operation?
                    1) Addition
                    2) Subtraction
                    3) Multiply
                    4) Divide
  MSG

  prompt(operator_prompt)

  answer = ''
  loop do
    answer = gets.chomp
    if %w(1 2 3 4).include?(answer)
      break
    else
      prompt("Please select a valid number.")
    end
  end

  result = case answer
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("The answer is #{result}")

  prompt('Would you like to evaluate more numbers? Y)es.')
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

prompt("GoodBye.")
