require 'pry'
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
  amount.to_s.to_f == amount && amount.to_i > 0
end

def valid_integer?(num)
  num.to_i.to_s == num && num.to_i > 0
end

def valid_percentage_rate?(rate)
  rate.to_s.to_f == rate && rate.to_f > 0
end

def format_apr(decimal)
  if decimal.chars.pop == '%'
    format('%.4f', decimal.delete('%').to_f * 0.01).to_f
  else
    format('%.4f', decimal.to_f * 0.01).to_f
  end
end

def monthly_payment(monthly_percentage_rate, loan_duration_months, loan_amount)
  loan_amount * (monthly_percentage_rate / (1 -
  (1 + monthly_percentage_rate)**(-loan_duration_months)))
end

loop do 
  system "clear"
  prompt('Hi welcome to the mortgage calculator!')
  
  loan_amount = 0
  loop do
    prompt('What is the loan amount in dollars?')
    loan_amount = gets.chomp.to_f
    break if valid_float?(loan_amount)
    prompt("#{format('%.0f',loan_amount)} doesn't appear to be an valid loan amount.")
  end
  
  formatted_apr = ''
  loop do
    prompt("What is the Annual Percentage " \
            "Rate expressed as a decimal percentage?")
    prompt('For example, 3.75% or 2.50%')
    annual_percentage_rate = gets.chomp
    formatted_apr = format_apr(annual_percentage_rate)
    break if valid_percentage_rate?(formatted_apr)
    prompt("#{annual_percentage_rate} doesn't appear to be a valid annual percentage rate.")
  end
  
  loan_duration = ''
  loop do
    prompt('What is the loan duration in years.')
    loan_duration = gets.chomp
    break if valid_integer?(loan_duration)
    prompt("That doesn't look like a valid loan duration in years.")
  end
  
  monthly_percentage_rate = formatted_apr.to_f / 12
  loan_duration_months = loan_duration.to_i * 12
  
  system "clear"
  prompt "The monthly interest rate is #{monthly_percentage_rate * 100}%."
  prompt "The loan duration is #{loan_duration_months} months."
  prompt "The monthly payment is $#{format('%.2f',
  monthly_payment(monthly_percentage_rate,
                loan_duration_months,
                loan_amount.to_f))}."
  prompt("Would you like to calculate another loan payment? (y)es or (N)o")
  break unless ['y', 'yes'].include?(gets.chomp.downcase)
end

prompt('Goodbye.')
