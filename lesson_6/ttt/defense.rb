
require 'pry'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def swap_token(token)
  token == 'X' ? 'O' : 'X'
end

def clean_selections(options)
  options.select { |sqr| sqr != 'X' && sqr != 'O' }
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
  return false if play_options.empty?
  clean_selections(play_options).sample.join.to_i
end


token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
p two_squares_played(board, token)

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
p two_squares_played(board, swap_token(token))

token = 'O'
board = ['X','X',3,4,5,6,7,'O','O']
p two_squares_played(board, token)

arr = ['X',3,4,5,'O']
p clean_selections(arr)