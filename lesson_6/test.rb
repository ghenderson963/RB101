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
current_player = 'player'

def place_piece(board,current_player,square)
  if current_player == 'player'
    board[square] = 'X'
  else
    board[square] = 'O'
  end
  board
end

def check_across(board, piece)
  counter = 0
  loop do

    if board[counter,3].count(piece) == 2
      board[counter,3].each do |square|
        return square unless square == piece
      end
    else
      counter += 3
      break if counter > 8
    end
  end

  return false
  end

def check_down(board,piece)
  counter = 0
  loop do
    #binding.pry
    if [board[counter],board[counter + 3], board[counter + 6]].count(piece) == 2
      #binding.pry
      [board[counter],board[counter + 3], board[counter + 6]].each do |square|
        return square unless square == piece
      end
    else
      counter += 1
      break if counter > 2
    end

  end
  return false
end

def check_diagonal(board, piece)
  if [board[0], board[4], board[8]].count(piece) == 2
    #binding.pry
    [board[0], board[4], board[8]].each do |square|
      return square unless square == piece 
    end
  elsif [board[2],board[4],board[6]].count(piece) == 2
    [board[2],board[4],board[6]].each do |square|
      return square unless square == piece
    end
  else
    return false
  end
    #          [[arr[2],[arr[4],arr[6]]
end

def check_middle(board, current_player)
  return 4 if board[4] == 4
end

def random_square(board, current_player)
  loop do
    square = board.sample 
    return square if (0..8).include?(square)
  end

end

def computer_turn(board,piece)
  current_player = 'computer'
  if check_across(board,piece)
    place_piece(board,current_player,check_across(board,piece))
  elsif check_down(board,piece)
    place_piece(board,current_player,check_down(board, piece))
  elsif check_diagonal(board, piece)
    place_piece(board,current_player,check_diagonal(board, piece))
  elsif check_middle(board, piece)
    place_piece(board, current_player, check_middle(board,piece))
  else
    place_piece(board, current_player, random_square(board, piece))
  end
end

# piece = 'X'
# current_player = 'computer'
# board = [0,1,2,3,'X',5,6,7,8]
# computer_turn(board, piece)
# p board
piece = 'O'
#across test
current_player = 'computer'
board = [0,1,2,3,4,5,'O','O',8]
puts computer_turn(board,piece) == [0,1,2,3,4,5,'O','O','O']

# down test - should play square 8
current_player = 'computer'
board = [0,1,'O',3,4,'O',6,7,8]
puts computer_turn(board, piece) == [0,1,'O',3,4,'O',6,7,'O']

# diagonal test - should play square 6
current_player = 'computer'
board = [0,1,'O',3,'O',5,6,7,8]
puts computer_turn(board, piece) == [0,1,'O',3,'O',5,'O',7,8]

# middle test - should play square 4
current_player = 'computer'
board = [0,1,2,3,4,5,6,7,8]
p computer_turn(board, piece) == [0,1,2,3,'O',5,6,7,8]

# clean board random test - should play random square
current_player = 'computer'
board = [0,1,2,3,'O',5,6,7,8]
p computer_turn(board, piece) 


# p check_across(board,piece)
# p check_down(board, piece)
# p check_diagonal(board, piece)

#    b. return all the sub arrays that have 2 plays.
# 2. if 2 of the 3 are played play the first open square.
# 3. 

#if board[i] == 'X' && board[i + 1] == 'X'
#  next unless square_free?(board, board[i + 2 ])