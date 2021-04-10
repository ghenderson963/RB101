# 1.


# 2.



# 3.



# 4. Fix the code below so that it returns a false condition and handles the case were more or fewer than 4 components
# to the IP address or given.

def is_an_ip_number?(num)
  num.to_i > 0 && num.to_i <= 255
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.count == 4

  number_check = dot_separated_words.map do |word|
  is_an_ip_number?(word)
  end

  !number_check.include?(false)
end

puts dot_separated_ip_address?('233.111.234.123')


