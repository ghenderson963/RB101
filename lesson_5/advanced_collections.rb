# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

arr.sort do |a,b|
  b.to_i <=> a.to_i
end

# How would you order this array of hashes based on the year of publication of each book, from the 
# earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by { |book| book[:published].to_i }

# For each of these collection objects demonstrate how you would reference the letter 'g'
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].keys[0]

# For each of the collections below show how you would change 3 to 4.
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0]

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] = 4

# Given the hash below, figure out the total age of just the male members of the family.
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# initialize a integer variable total_age = 0
# iterate through the hash.
# for each person if they are male add their age to total_age
#

total_age = 0

munsters.each do |name, value|
  total_age += value["age"] if value["gender"] == "male" 
end
puts total_age

# Using the hash below print out each name age and gender using the template:
# (Name) is a (age)-year-old (male or female).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each_pair do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}"
end

# Given the code below, what would the final values of a and b be?
a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# => arr[0] = arr[0] + 2  [4,[5,8]]
# => arr[1][0] = arr[1][0] - a [4,[3,8]]

# Using the each method write some code to output all of the vowels from the strings below.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = []
hsh.each_value do |words_array|
  words_array.each do |word|
    word.chars.each do |char|
      vowels << char if ['a','e','i','o','u'].include?(char)
    end
  end 
end
p vowels

# Given the data structure below, return a new array of the same structure but with the sub arrays being ordered 
# (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
new_arr = arr.map do |arr|
            arr.sort do |a,b|
              b <=> a 
            end
          end
p new_arr

# Given the data structure below and without modifying the original array, use the map method to return a new array
# identical in structure to the original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  new_hsh = {}
  hsh.each do |key, value|
    new_hsh[key] = value + 1
  end
   p new_hsh
end

# Given the following data structure use a combination of methods, including either the select or reject
# method to return a new array identical in structure to the original but containing only the integers
# that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |arr|
  arr.select { |num| num % 3 == 0 }
end

# Given the data structure below and without using the to_h method, write some code that will return a hash 
# where the first key is the first item in each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

result_hsh = {}
arr.each do |arr1| 
  result_hsh[arr1[0]] = arr1[1]
end
p result_hsh

# Using the arr below return a new array containing the same sub-arrays as the original but 
# ordered logically by only taking into consideration the odd numbers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
# the sorted array should look like
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
arr.sort_by do |small_arr|
  small_arr.select { |num| num.odd? }
end
 
# Given the data structure below write some code to return an array containing the colors
# of the fruit and the sizes of the vegetables.  The sizes should be uppercase and the colors
# should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
# return the colors of the fruit
# return sizes of the vegetables
# size should be uppercase
# colors should be capitalized 
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

new_arr = []
hsh.each_value do |details|
  if details[:type] == 'fruit'
    new_arr << details[:colors].map(&:capitalize)
  else
    new_arr << details[:size].upcase
  end
end

p new_arr 

# Using the data structure below write some code to return an array which contains only the hashes
# where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

# write a method that will create a uuid with 
# 5 sections broken up 8-4-4-4-12
# 32 hexadecimal characters
# shown as a string
# ex. "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
#
# Write a method that returns a random hexidecimal digit
# build an array that holds all the possible hexadecimal digits
# build an array that has the section numbers
# iterate through the 

HEXADECIMAL = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F']
FORMAT = [8,4,4,4,12]

def create_uuid
  new_uuid = ''
  FORMAT.each do |num|
    num.times { new_uuid << HEXADECIMAL.sample }
    new_uuid << '-' unless num == 12
  end

  new_uuid
end

