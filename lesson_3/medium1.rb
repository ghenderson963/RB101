# Write a one-line program that creates the following output 10 times, with the subsequent line
# indented one space to the right.
line = 'The Flintstones Rock!'

10.times { puts line.prepend(' ') }
10.times { |num| puts ' ' * num + 'The Flintstones Rock!' }

# 2. Why does the following error?  Give 2 ways to fix it.
puts "the value of 40 + 2 is " + (40 + 2)
# it errors because it is putting a string and an integer together.
# you could fix it by:
puts "the value of 40 + 2 #{40 + 2}"
puts "the value of 40 + 2" + ((40 + 2).to_s)

 # 3. The method below will fail if the input is 0 or a negative number, fix the bug.
 def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

def factors(number)
  divisor = number
  factors = []
  
  while divisor >= 1
    factors << number / divisor if number % divisor == 0 
    divisor -=1 
  end
  factors
end

# 4.  explain the difference between using << and + to at elements into an array.
# << alters the original array while + does not.

# 5. What is wrong with the code below.
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# limit is defined outside the scope of the fib method.
# you could fix this by adding the limit variable as an argument to the fib method.

# 6. What is the output of the code below?
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# 34

# 7. What does the code below do to the hash?
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# 8. What does the code below return?
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# paper

# 9. What is the outcome of the code below?
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)
# no