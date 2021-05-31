
require 'pry'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def swap(token)
  token == 'X' ? 'O' : 'X'
end

def clean_selections(options)
  options.select { |sqr| sqr != 'X' && sqr != 'O' }
end

def last_square(brd)
  square = brd.select { |sqr| sqr != 'X' && sqr != 'O' }
  #binding.pry
  return square.join.to_i if square.count == 1
  return false if square.count > 1
end
 
def find_available_winning_plays(brd, line, token)
  #line.select { |square| brd[square] != 'X' && brd[square] != 'O' }
  line.select { |square| brd[square] != token }
end

def two_squares_played(brd, token)
  play_options = []

  WINNING_LINES.each_with_index do |line|
    open_squares = find_available_winning_plays(brd, line, token)

    if open_squares.count == 1
      play_options << open_squares.map { |num| brd[num] }
    end

  end
  binding.pry
  return false if play_options.empty?
  clean_selections(play_options).sample.join.to_i
end

def check_middle(brd) # return single int
  return 5 if brd[4] == 5
end

def random_square(brd)
  loop do
    square = brd.sample
    return square if (0..8).include?(square)
  end
end


def place_piece(brd, sqr, token)
  brd[sqr - 1] = token
end

def computer_turn(brd, token)
 #binding.pry
  if last_square(brd)
    place_piece(brd, last_square(brd), token)
  elsif two_squares_played(brd, token)
    place_piece(brd, two_squares_played(brd, token), token)
  elsif two_squares_played(brd, swap(token))
    place_piece(brd, two_squares_played(brd, swap(token)), token)
  elsif check_middle(brd)
    place_piece(brd, check_middle(brd), token)
  else random_square(brd)
   # binding.pry
    place_piece(brd, random_square(brd), token)
 

  end
  
end


token = 'O'
board = [1,2,3,4,5,6,7,'O','O']
computer_turn(board, token)
p board

# test last square
token = 'O'
board = ['X','O','X','X','O','X','O','X',9]
computer_turn(board, token)
p board

# test offense
token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
computer_turn(board, token)
p board

# test offense different line should play 7
token = 'O'
board = [1,2,3,4,5,6,7,'O','O']
computer_turn(board, token)
p board 

# Test defense
token = 'O'
board = ['O',2,3,4,5,6,7,'X','X']
computer_turn(board, token)
puts 'should play 7'
p board

# Test defense - choice over offense or defense.  should pick 7
token = 'O'
board = ['X','X',3,4,5,6,7,'O','O']
computer_turn(board, token)
p board

# Test middle - should play 5
token = 'O'
board = ['X',2,3,4,5,6,7,8,'O']
computer_turn(board, token)
puts '- middle -'
p board

# Test random square
token = 'O'
board = ['X',2,3,4,'X',6,7,8,'O']
computer_turn(board, token)
puts '- random -'
p board
puts ''

token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
place_piece(board, two_squares_played(board, token), token)
p board

token = 'O'
board = [1,2,3,4,5,6,7,'O','O']
p two_squares_played(board, token)

token = 'O'
board = ['X',2,3,'X', 'O','O',7,'O','O']
#binding.pry
p two_squares_played(board, token)

token = 'O'
board = ['X','X',3,4,5,6,7,'O','O']
p two_squares_played(board, token)

token = 'O'
board = [1,2,3,4,5,6,7,8,9]
p two_squares_played(board, token)

token = 'O'
board = [1,'O',3, 'X', 4,5,'O',7, 'X', 9]
p two_squares_played(board, token)

puts 'Defense! +++++++++++++++++++++'

token = 'O'
board = ['X','X',3,4,5,6,7,8,9]
p two_squares_played(board, swap(token))

token = 'O'
board = ['X','X',3,4,5,6,7,'O','O']
p two_squares_played(board, token)

arr = ['X',3,4,5,'O']
p clean_selections(arr)