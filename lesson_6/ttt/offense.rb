
require 'pry'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def find_available_winning_plays(brd, line, token)
  #line.select { |square| brd[square] != 'X' && brd[square] != 'O' }
  line.select { |square| brd[square] != token }
end

def offensive_play(brd, token)
  play_options = []

  WINNING_LINES.each_with_index do |line|
    open_squares = find_available_winning_plays(brd, line, token)

    if open_squares.count == 1
      play_options << open_squares.map { |num| brd[num] }
    end

  end
  return false if play_options.empty?
  play_options.sample[0]
end

token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
p offensive_play(board, token)

token = 'O'
board = [1,2,3,4,5,6,7,'O','O']
p offensive_play(board, token)

token = 'O'
board = ['X',2,3,'X', 'O','O',7,'O','O']
p offensive_play(board, token)

token = 'O'
board = ['X','X',3,4,5,6,7,'O','O']
p offensive_play(board, token)

token = 'O'
board = [1,2,3,4,5,6,7,8,9]
p offensive_play(board, token)

token = 'O'
board = [1,'O',3, 'X', 4,5,'O',7, 'X', 9]
p offensive_play(board, token)

# token = 'O'
# board = [1,2,3,4,5,6,7,'O','O']
# computer_turn(board, token)
# p board == [1,2,3,4,5,6,'O','O','O']

# # test last square
# token = 'O'
# board = ['X','O','X','X','O','X','O','X',9]
# computer_turn(board, token)
# p board == ['X','O','X','X','O','X','O','X','O']

# # test offense
# token = 'O'
# board = ['O','O',3,4,5,6,7,8,9]
# computer_turn(board, token)
# p board == ['O','O','O',4,5,6,7,8,9]

# # test offense different line should play 7
# token = 'O'
# board = [1,2,3,4,5,6,7,'O','O']
# computer_turn(board, token)
# p board == [1,2,3,4,5,6,'O','O','O']

# # Test defense
# token = 'O'
# board = ['O',2,3,4,5,6,7,'X','X']
# computer_turn(board, token)
# p board == ['O',2,3,4,5,6,'O','X','X']

# # Test defense - choice over offense or defense.  should pick 7
# token = 'O'
# board = ['X','X',3,4,5,6,7,'O','O']
# computer_turn(board, token)
# p board == ['X','X',3,4,5,6,'O','O','O']

# # Test middle - should play 5
# token = 'O'
# board = ['X',2,3,4,5,6,7,8,'O']
# computer_turn(board, token)
# p board = ['X',2,3,4,'O',6,7,8,'O']

# # Test random square
# token = 'O'
# board = ['X',2,3,4,'X',6,7,8,'O']
# computer_turn(board, token)
# puts '- random -'
# p board
# puts ''




# token = 'O'
# board = ['O','O',3,4,5,6,7,8,9]
# place_piece(board, two_squares_played(board, token), token)
# p board

# token = 'O'
# board = [1,2,3,4,5,6,7,'O','O']
# p two_squares_played(board, token)

# token = 'O'
# board = ['X',2,3,'X', 'O','O',7,'O','O']
# #binding.pry
# p two_squares_played(board, token)

# token = 'O'
# board = ['X','X',3,4,5,6,7,'O','O']
# p two_squares_played(board, token)

# token = 'O'
# board = [1,2,3,4,5,6,7,8,9]
# p two_squares_played(board, token)

# token = 'O'
# board = [1,'O',3, 'X', 4,5,'O',7, 'X', 9]
# p two_squares_played(board, token)

# puts 'Defense! +++++++++++++++++++++'

# token = 'O'
# board = ['X','X',3,4,5,6,7,8,9]
# p two_squares_played(board, swap(token))

# token = 'O'
# board = ['X','X',3,4,5,6,7,'O','O']
# p two_squares_played(board, token)

# arr = ['X',3,4,5,'O']
# p clean_selections(arr)