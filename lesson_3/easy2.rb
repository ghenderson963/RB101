# 1. Using the the hash below determine if "spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.key?('spot')
ages.has_key?('spot')
ages.include?('spot')

# 2.
munsters_description = "The Munsters are creepy in a good way."
# Using the string above convert it in the following ways 
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase!
# "The munsters are creepy in a good way."
munsters_description.capitalize!(munsters_description)
munsters_description.gsub!('Munsters', 'munsters')
# "the munsters are creepy in a good way."
munsters_description.downcase!(munsters_description)
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase!(munsters_description)

# 3. Using the hash below add ages for Marilyn and Spot.
ages = { 'Herman' => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)

# 4. Does the name 'Dino' appear in the string below.
advice = "Few things in life are as important as house training your pet dinosaur."
advice.match?('dino')

# 5. Show an easier way to write the array below.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles) 

# 6. How can we add "Dino" to our usual array:
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flinstones << 'Dino'

# 7. How can we add multiple items to the array below?
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flinstones << 'Jake' << 'Pam'
flinstones.push('Jake').push('Pam')
flinstones.concat(%w(Jake Pam))

# 8. Shorten the sentence below by removing everything starting from house.
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

# 9. Write a one-liner to count the number of lower-case 't's in the following string.
statement = 'The Flintstones Rock!'
statement.count('t')

# 10. Using the string below how could we align it in a 40 character wide table.  How could we easily center
# that title aboce thetable with spaces?
title = "Flintstone Family Members"

