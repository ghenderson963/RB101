# 1. What does the code below print out?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# It prints out:
1
2
2
3
# uniq does remove the duplicates but it returns the original array.

# 2. Describe the difference between ! and ? in Ruby.
# ! equates to not so if it is before a = it means not.
# What is != and where should you use it?
#   != can be used in a conditional to show something is not equals.
# put ! before something like words.uniq! 
#   turns the variable into a boolean generally false.
# put ! after something, like words.uniq!
#  this generally means that the method mutates the caller.
# put ? before something
#  it creates an error.
# put !! before something, like !!user_name
#  turns it to true.

# 3. Replace the word "important" with "urgent" in this string.
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important','urgent')

# 4. The Ruby Array class has several methods for removing items from the array.  2 of them have 
# very similar names.
numbers = [1, 2, 3, 4, 5]
# what do the following method calls do.
numbers.delete_at(1)
numbers = [1,3,4,5]

numbers.delete(1)
numbers = [2,3,4,5]

# 5. Determine if 42 lies between 10 and 100
(10..100).cover?(42)

# 6. using the string below show 2 different ways to put the expected "four score and" in front.
famous_words = "seven years ago..."
"four score and " + famous_words
"four score and " << famous_words
famous_words.prepend("four score and ")

# 7. Make the below into an un-nested array.
arr = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
arr.flatten!

# 8. Using the hash below turn it into an array containing only 2 elements: Barney's name and number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc('barney')

