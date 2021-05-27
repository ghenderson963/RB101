require 'pry'

# Winning selections
# across
# 0,1,2
# 3,4,5
# 6,7,8
# down
# 0,3,6
# 1,4,7
# 2,5,8
# diagonal
# 0,4,8
# 2,4,6

# Computer turn
# 1. check if any of the winning plays is close by seeing if 2 of 
#    the 3 squares are played.
#    a. break all the win, ning triples up into sub arrays.
#       i. arr[0,3]
#          arr[3,3]
#          arr[6,3]
#          [[arr[0],arr[3],arr[6]]
#          [[arr[1],arr[4],arr[7]]
#          [[arr[2],arr[5],arr[8]]
#          [[arr[0],arr[4],arr[8]]
#          [[arr[2],[arr[4],arr[6]]

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
                 [0,3,6],[1,4,7],[2,5,8],
                 [0,4,8],[2,4,6]]


def square_free?(board, square)
  board[square] != 'X' && board[square] != 'O'
end

def place_piece(board, square, current_player_symbol)
  board[square] = current_player_symbol
end

def change_symbol(player_symbol)
  player_symbol == 'X' ? 'O' : 'X'
end

def list_of_empty_squares(board)
  board.select { |num| num != 'O' && num != 'X' }
end

def find_potential_plays(board, symbol)
  squares = []
  WINNING_LINES.each_with_index do |line, idx|
    squares << [line.select { |num| board[num] == symbol}.count, idx]
  end

  squares.select { |indx_count| indx_count[0] == 2 }.flatten
  return false if squares.empty?
end

def choose_which_play(board, symbol)
      #square = []
      squares_to_play = find_potential_plays(board, symbol)

      WINNING_LINES[squares_to_play[1]].each do |num|

        square = if board[num] != symbol && square_free?(board, num)
                    board[num]
                 end
      end
    return square[0]
end

def computer_turn(board, symbol)
  winning_arr = []
  #loop do
    offensive_squares = find_potential_plays(board, symbol)
    defensive_squares = find_potential_plays(board, change_symbol(symbol))
    

    square = if offensive_squares
      binding.pry
               choose_which_play(offensive_squares, board, symbol)
             elsif
               choose_which_play(defensive_squares, board, symbol)
             elsif
              one_filled_square(board, symbol)
             elsif
              middle_square(board, symbol)
             else
              random_square(board, symbol)
             end
    
    # square = 10
    # squares_to_play.each do |arr|      
    #   if arr[0] == 2
    #     WINNING_LINES[arr[1]].each do |num|
    #       square = if board[num] != symbol && square_free?(board, num)
    #                   board[num]
    #                 else
    #                   next
    #                 end
    #     end
    #   end
    # end

    
    #p symbol
    # return square if square != 10
  #end
end
    # if line.count('X') == 2
    #   line.select { |num| num != symbol }
    # end

# check all the winning lines for an offensive move
#
# check all the winning lines for a defensive move
# play the middle square
# play square at random


# def open_square(board, num, symbol)
#   p num
#   binding.pry
#   return num if board[num] != symbol
# end

# symbol = 'O'
# board = ['X','X',3,4,5,6,7,8,9]
# p computer_turn(board, symbol)


# 1. go through winning_lines and find out which lines have 2 of the computers symbols.
# 2. find the winning_lines index and the index of the open square.
# 3. computer should play the index of the 



# check_last_square
# symbol = 'X'
# board = ['X','O','X','O','X','O','X','O',9]
# p computer_turn(board, symbol)
#check_last_square(board1)

# current_player = 'computer'
symbol = 'O'
board = ['X','X',2,3,4,5,'O',7,8]
#computer_turn(board, symbol)
place_piece(board, computer_turn(board, symbol), symbol)
p board

# p computer_turn(board) == [0,1,2,3,4,5,'O','O','O']

# # down test - should play square 8
# current_player = 'computer'
 board = [0,1,'O',3,4,'O',6,7,8]
symbol = 'O'
p computer_turn(board, symbol)
place_piece(board, computer_turn(board, symbol), symbol)
p board
# p computer_turn(board) == [0,1,'O',3,4,'O',6,7,'O']

# # diagonal test - should play square 6
# current_player = 'computer'
symbol = 'O'
board = [0,1,'O',3,'O',5,6,7,8]
p computer_turn(board, symbol)
place_piece(board, computer_turn(board, symbol), symbol)
p board
# p computer_turn(board) == [0,1,'O',3,'O',5,'O',7,8]

# # middle test - should play square 4
# current_player = 'computer'
# board = [0,1,2,3,4,5,6,7,8]
# p computer_turn(board) == [0,1,2,3,'O',5,6,7,8]

# # clean board random test - should play random square
# current_player = 'computer'
# board = [0,1,2,3,'O',5,6,7,8]
# p computer_turn(board) 

