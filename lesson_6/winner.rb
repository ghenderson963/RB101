require 'pry'
# def winner?(board)

#   counter = 0
#   loop do 
#     return true if board[counter,3].count('X') == 3 || board[counter,3].count('O') == 3
#     break if counter > 7
#     counter += 3
#   end

#   counter = 0
#   loop do
#     return true if [board[counter], board[counter + 3], board[counter + 6]].count('X') == 2 || [board[counter], board[counter + 3], board[counter + 6]].count('O') == 2
#     counter += 1
#     break if counter > 3
#   end 

#   return true if [board[0], board[4], board[8]].count('X') == 3 || [board[0], board[4], board[8]].count('O') == 3
#   return true if [board[2],board[4],board[6]].count('X') == 3 || [board[2],board[4],board[6]].count('O') == 3
# end

# board = ['X','X','X',4,5,6,7,8,9]
# p winner?(board)

def check_across(board)

  counter = 0
  loop do
    if board[counter, 3].count('X') == 2 && board[counter, 3].count('O') == 2
      board[counter, 3].each do |square|
        binding.pry
        return square unless square == 'O' || square == 'X'
      end
    else
      counter += 3
      break if counter > 8
    end
    return false
  end
end

def check_down(board)
  counter = 0
  loop do
    if [board[counter], board[counter + 3], board[counter + 6]].count('X') == 2 \
      || [board[counter], board[counter + 3], board[counter + 6]].count('O') == 2
      [board[counter],board[counter + 3], board[counter + 6]].each do |square|
        binding.pry
        return square unless square == 'X' || square == 'O'
      end
      return false
    else
      counter += 1
      break if counter > 2
    end
  end

  return false
end

def check_diagonal(board)
  
  if [board[0], board[4], board[8]].count('X') == 2 || [board[0], board[4], board[8]].count('O') == 2
    binding.pry
    [board[0], board[4], board[8]].each do |square|
      return square unless square == 'X' || square == 'O'
    end
  elsif [board[2], board[4], board[6]].count('X') == 2 || [board[2], board[4], board[6]].count('O') == 2
    [board[2], board[4], board[6]].each do |square|
      return square unless square == 'X' || square == 'O'
    end
  end
  return false
end

def check_middle(board)
  return 5 if board[4] == 5
end

def random_square(board)
  loop do
    square = board.sample
    return square if (0..8).include?(square)
  end
end

def check_last_square(board)
  selection = []
  if board.count('X') + board.count('O') == 8
    selection = board.select { |square| square != 'X' && square != 'O' }
  end
  return selection[0] if selection[0]
end

def place_piece(board, square, current_player_symbol)
  board[square] = current_player_symbol
end



def computer_turn(board, current_player_symbol)
  if check_last_square(board)
    check_last_square(board) - 1
  elsif check_across(board)
    check_across(board) - 1
  elsif check_down(board)
    check_down(board) -1
  elsif check_diagonal(board)
    check_diagonal(board) -1
  elsif check_middle(board)
    check_middle(board) -1
  else
    binding.pry
    random_square(board) -1
  end
end

#check_across
board = ['X','X',3,'X',5,6,7,8,9]
p computer_turn(board,'X') #== [0,1,2,3,4,5,'O','O','O']
p board

# check_last_square  
# board1 = ['X','O','X','O','X','O','X','O','X']
# check_last_square(board1)

# current_player = 'computer'
# board = [0,1,2,3,4,5,'O','O',8]
# p computer_turn(board) == [0,1,2,3,4,5,'O','O','O']

# # down test - should play square 8
# current_player = 'computer'
# board = [0,1,'O',3,4,'O',6,7,8]
# p computer_turn(board) == [0,1,'O',3,4,'O',6,7,'O']

# # diagonal test - should play square 6
# current_player = 'computer'
# board = [0,1,'O',3,'O',5,6,7,8]
# p computer_turn(board) == [0,1,'O',3,'O',5,'O',7,8]

# # middle test - should play square 4
# current_player = 'computer'
# board = [0,1,2,3,4,5,6,7,8]
# p computer_turn(board) == [0,1,2,3,'O',5,6,7,8]

# # clean board random test - should play random square
# current_player = 'computer'
# board = [0,1,2,3,'O',5,6,7,8]
# p computer_turn(board)