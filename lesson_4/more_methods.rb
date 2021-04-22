# 1. Turn the array below into a hash where the names are the keys and the values are the positions in the array.
# - initialize a result hash
# - iterate through the array 
# - assign each name as a key and the indexes as the value of the result hash
# - return the hash
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

results = {}
flintstones.each_with_index do |element, indx|
  results[element] = indx
end

puts results

# 2. Add up all the ages from the hash below.
# - initialize a result_sum 
# - iterate through the hash
# - sum all the values 
# - return the result
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
result_sum = 0
ages.each do |name, age|
  result_sum += age
end
puts result_sum

# 3. Remove any ages over 100 from the hash below.
# - iterate through the hash
# - in each iteration check if the value is 100 or greater
# - delete the key and the value if over or = 100

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |name, age|
  age >= 100
end

puts ages

puts ages.keep_if { |_, age| age < 100 }
puts ages

# 4. Pick out the minumum age from the Munster family hash.
# - initialize a integer minimum_age
# - iterate through the hash
# - in each iteration compare the previous value to this one
# - if the previous value is less than the current value save the previous
# - else current value is the smaller save that one.
# - return the minimum_age value.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

puts ages.values.min 
  

# 5. In the array below find the index of the first name that starts with 'be'
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.index { |name| name[0,2] == 'Be' }

# 6. Amend the array below so that the names are all shortened to just the first 3 characters.
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones.map { |name| name[0,2] }

# 7. Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

# change the string into an array of substrings
# initialize a hash variable
# iterate through the array of substrings
# during each iteration
#  if the letter exists in the hash already skip it
#  Else
#  set the letter as the key and put the number of times it occurs as the value
#  return the hash
result = {}
letters = statement.downcase.chars
letters.each do |letter|
  result[letter] = letters.count(letter) if !result.include?(letter)
end
puts result 

# 9.  Write your own version of the Rails method titleize
# - take the string and split it into an array of substrings.
# - iteratate through the string and capitalize each substring
# - rejoin the the array of substrings into 1 string

def titleize(phrase)
  phrase.split.map(&:capitalize).join(' ')
end

puts titleize('gary is great')

# 10.  