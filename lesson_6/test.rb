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

def prompt(message)
  puts "==> #{message}"
end

def display_table(board)
  system("clear")

  puts "                             "
  puts "          |       |          "
  puts "      #{board[0]}   |   #{board[1]}   |   #{board[2]}          "
  puts "   _______|_______|_______   "
  puts "          |       |          "
  puts "      #{board[3]}   |   #{board[4]}   |  #{board[5]}          "
  puts "   _______|_______|_______   "
  puts "          |       |          "
  puts "      #{board[6]}   |   #{board[7]}   |  #{board[8]}          "
  puts "          |       |          "
  puts "                             "
end

def pick_first_player
  ['Player','Computer'].sample
end

def choose_symbol
  loop do
    puts ''
    prompt "Would you like to be Xs or Os?"
    player_piece = gets.chomp
    return player_piece if ['X','O'].include?(player_piece)
    prompt "Please choose an X or an O."
  end
end

def set_computer_symbol(player_symbol)
  player_symbol == 'X' ? computer_piece = 'O' : computer_piece = 'X'
end

def initialize_board
  new_board = []
  (1..9).map { |num| new_board[num] = num }
end

def switch_player(player)
  return 'Computer' if player == 'Player'
  return 'Player' if player == 'Computer'
end

def square_free?(board, square)
  board[square] != 'X' && board[square] != 'O'
end

def place_piece(board,current_player,square, current_player_symbol)

  if current_player == 'player'
    board[square] = current_player_symbol
  else
    board[square] = current_player_symbol
  end
  board
end

def check_across(board)
  counter = 0
  loop do

    if board[counter,3].count('X') == 2 || board[counter,3].count('O') == 2
      board[counter,3].each do |square|
        return square unless square == 'O' || square == 'X'
      end
    else
      counter += 3
      break if counter > 8
    end
    return false
  end

  return false
  end

def check_down(board)
  counter = 0
  loop do

    if [board[counter], board[counter + 3], board[counter + 6]].count('X') == 2 || [board[counter], board[counter + 3], board[counter + 6]].count('O') == 2
      [board[counter],board[counter + 3], board[counter + 6]].each do |square|
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
    [board[0], board[4], board[8]].each do |square|
      return square unless square == 'X' || square == 'O'
    end
  elsif [board[2],board[4],board[6]].count('X') == 2 || [board[2],board[4],board[6]].count('O') == 2
    [board[2],board[4],board[6]].each do |square|
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

def computer_turn(board, current_player_symbol)
  current_player = 'computer'

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
    random_square(board) -1
  end
end

def player_turn(board, player_symbol)
  player_input = ''
    loop do 
      prompt "Select a square numbered 1-9."
      player_input = gets.chomp.to_i - 1
      return player_input if (0..9).include?(player_input)
      prompt "The number needs to be between 0 - 9!"
      puts ''
    end
    
end

def current_player_turn(board,current_player, player_symbol)
  current_player == 'Player' ? player_turn(board, player_symbol) : computer_turn(board, player_symbol)
end

def winner?(board)

  counter = 0
  loop do 
    return true if board[counter,3].count('X') == 3 || board[counter,3].count('O') == 3
    break if counter > 7
    counter += 3
  end

  counter = 0
  loop do
    return true if [board[counter], board[counter + 3], board[counter + 6]].count('X') == 3 || [board[counter], board[counter + 3], board[counter + 6]].count('O') == 3
    break if counter > 3
    counter += 1
  end 

  return true if [board[0], board[4], board[8]].count('X') == 3 || [board[0], board[4], board[8]].count('O') == 3
  return true if [board[2], board[4], board[6]].count('X') == 3 || [board[2], board[4], board[6]].count('O') == 3
end

def board_full?(board)
  board.count('X') + board.count('O') == 9
end
   
system("clear")
prompt "Welcome to Tic Tac Toe!"
prompt "Choosing who goes first...."
5.times do
  sleep 0.25
  print '.'
end
puts '.'
current_player = pick_first_player
prompt "#{current_player} goes first!"

player_symbol = choose_symbol
computer_symbol = set_computer_symbol(player_symbol)
current_player_symbol = current_player == 'Player' ? player_symbol : computer_symbol

board = initialize_board
display_table(board)
square = 10
loop do
  square = current_player_turn(board,current_player, current_player_symbol)
  if square_free?(board, square)
    place_piece(board, current_player, square, current_player_symbol)
  else
    prompt "That square is taken.  Please choose another."
    square = gets.chomp.to_i - 1
    square = current_player_turn(board,current_player, current_player_symbol)
  end
  break if board_full?(board)
  break if winner?(board)
  sleep 1
  display_table(board)
  prompt "#{current_player} choose to play square #{square + 1}."
  current_player = switch_player(current_player)
  current_player_symbol = current_player == 'Player' ? player_symbol : computer_symbol
  sleep 1
end
display_table(board)

puts ''
board_full?(board) ? (prompt "Looks like it is a tie!") : (prompt "#{current_player} wins!")

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

