# write a method that counts the number of occurances of 
# element of a given array.
# case of the elements matters
# once counted print the count 
# Ex
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2
# ctl /
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

# initialize a new hash to store the results in
# iterate through the array in each iteration
# - IF the current element does not exist as a key in the hash
# -   add the element as a key and count the number of occurance
#      as the value
# - return the hash
# - iterate through the hash and print the key value pairs

def count_occurrences(arr)
  occurances = {}
  arr.each do |vehicle|
    if !occurances.has_key?(vehicle)
      occurances[vehicle] = arr.count(vehicle)
    end
  end
  display_hash(occurances)
end

def display_hash(hsh)
  hsh.each { |k,v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
