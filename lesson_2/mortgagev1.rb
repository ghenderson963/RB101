# build a mortgage calculator
# Need 3 pieces of information
# 1. the loan amount
# 2. the annual percentage rate APR
# 3. the loan duration
# calculate the following:
# 1. monthly interest rate
# 2. loan duration in months
# 3. monthly payment
# formula m = p * (j / (1 - (1 + j)**(-n)))

def prompt(str)
  puts "==> #{str}"
end

def valid_float?(amount)
  amount.to_f.to_s == amount
end

def valid_integer?(num)
  num.to_i.to_s == num
end

def valid_percentage_rate?(rate)
  rate.to_s.to_f == rate
end

def format_apr(decimal)
  if decimal.chars.pop == '%'
    sprintf('%.4f', decimal.delete('%').to_f * 0.01).to_f
  else
    sprintf('%.4f', decimal.to_f * 0.01).to_f 
  end
end




prompt('Hi welcome to the mortgage calculator!')

loop do 
  prompt('What is the loan amount in dollars?')
  loan_amount = gets.chomp
  if valid_integer?(loan_amount)
    break
  else
    prompt("#{loan_amount} doesn't appear to be an valid loan amount.")
  end
end

formated_apr = ''
loop do
  prompt('What is the Annual Percentage Rate expressed as a decimal percentage?')
  prompt('For example, 3.75% or 2.50%')
  annual_percentage_rate = gets.chomp
  formated_apr = format_apr(annual_percentage_rate)
  if valid_percentage_rate?(formated_apr)
    formated_apr
    break
  else
    prompt("That doesn't appear to be a valid annual percentage rate.")
  end
end

loan_duration = ''
loop do
  prompt('What is the loan duration in months.')
  loan_duration = gets.chomp
  if valid_integer?(loan_duration)
    break
  else
    prompt("That doesn't look like a valid loan duration in months.")
  end
end


