require 'pry'

# Write a madlibs program that reads in some text from a file and then plugs in a selection of randomized nouns,
# verbs, adjectives, and adverbs into that text and prints it.

# 1. read in text from file
#
# 2. iterate through each line
# 3. if you git a %{} look up in a hash for the appropriate response
# 4. put the response in the file 
# 5. write the new text to the screen
#
hsh = {
  "adjective" =>['quick', 'lazy', 'sleepy', 'ugly'],
  "noun" => ['fox', 'dog', 'head', 'leg'],
  "verb" => %w( jumps lifts bites licks ),
  "adverb" => %w( easily lazily noisily excitedly )
}


File.foreach("sentences2.txt") do |line|
  puts format(line, adjective: hsh['adjective'].sample,
                    noun:      hsh['noun'].sample,
                    verb:      hsh['verb'].sample,
                    adverb:     hsh['adverb'].sample)
end

# Write a method that displays an 8-pointed star in an n x n grid, where n is an odd integer that is supplied as an 
# argument to the method.  The smallest such star you need to handle is a 7 X 7 grid.

# 3 things to know
# 1. number of spaces per row = n / 2 -1
# 2. number of stars in the middle always == n
# 3. where the middle is middle = n /2 - 1
#
#(7)
#middle = 7 / 2 = 3
# starting_spaces = 0
# between_spaces = middle - 1 = 2

# print " " * starting_spaces
# print "*" 
# print " " * between_spaces
# print "*"
# print " " * between_spaces
# puts "*"

# recalculate starting spaces and between_spaces
# starting_spaces += 1
# between_spaces -+ 1
#
# break when starting_spaces == middle + 1

# 2 loops
# line = ''
# innerloop breaks when line.length > n
# line << starting_spaces * " "
# line <<  "*"
# line << between_spaces * " "
# line << "*"
#
# break if line.length <= n
# puts line


# starting_spaces += 1
# between_spaces -+ 1


# outer_loop 


# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

def build_line(starting_spaces, between_spaces, n)
  line = ''
  line << " " * starting_spaces unless between_spaces < 0
  3.times do 
    line << "*"
    line << " " * between_spaces
    break if line.length > n
  end
  line
end

def star(n)
  middle = n / 2
  starting_spaces = 0
  between_spaces = middle - 1
  
  loop do
    puts build_line(starting_spaces, between_spaces, n)
    starting_spaces += 1
    between_spaces -= 1
    break if between_spaces < 0
  end
  
  puts "*" * n
  starting_spaces = middle - 1
  between_spaces = 0

  loop do 
    line = ''
    puts build_line(starting_spaces, between_spaces, n)
    break if starting_spaces <= 0
    starting_spaces -= 1
    between_spaces += 1 
  end
puts " "
end
# print_row
# spaces = ' ' * (middle - 1)
# line = Array.new(3, '*').join(spaces)
# puts line.center(n)
#


# refactoring a bit..../
# use center with puts to eliminate the starting+spaces
# need to calculate how many spaces
# spaces = middle -1
# print it centered on the grid
# middle.downto(1) { |distance| print_row(n, middle) }
# puts 
#  

def print_row(distance, n)
  spaces = ' ' * (distance - 1)
  line = Array.new(3, '*').join(spaces)
  #binding.pry
  puts line.center(n)
end

def starv1(n)
  middle = (n - 1) / 2
  middle.downto(1) { |distance| print_row(distance, n)}
  puts '*' * n
  1.upto(middle) { |distance| print_row(distance, n)}
end



starv1(7)
puts ''
star(9)
star(11)

#*  *  *
 #* * *
  #***
#*******
  #***
 #* * *
#*  *  *

# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *