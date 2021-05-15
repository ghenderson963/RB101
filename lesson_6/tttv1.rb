# Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
# marks a square on the board. First player to reach 3 squares in a row, including diagonals,
# wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

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

# computer choice
# - check that the other player doesn't almost have a win
#    - check all the current board against all the winning plays
#    - if other player has other play has 2 of any winning play place our piece there.
#    - if 0 == 'X' and 1 == 'X' || 1 == "X" && 2 == "X"
#    - then play 2 if not taken or 3 if not taken. 

i = 0
loop do 
  if board[i] == 'X' && board[i + 1] == 'X'
    next unless square_free?(board, board[i + 2 ])
    break
  elsif
    board[i + 1] == 'X' && board[i + 2] == 'X'
    next unless square_free?(board, board[i + 2])
    board[i + 1] == 'O'
    break
  end
  i += 1
end 



if board[0] == 'X' && board[1] == 'X' 
  board[2] = 'O'
  break
elsif board[0] == 'X' && board[2] == 'X'
  board[1] = 'O'
  break
elsif board[3] == 'X' && board[4] == 'X'
  board[5] == 'O'
  break
elsif



require 'pry'

def prompt(message)
  puts "==> #{message}"
end

def initialize_board
  new_board = []
  (1..9).map { |num| new_board[num] = "#{num}" }
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

def select_first_player
  ['Player','Computer'].sample
end

def place_piece(board,current_player,square)
  if current_player == 'player'
    board[square] = 'X'
  else
    board[square] = 'O'
  end
end

def square_free?(board, piece)
  board[piece] != 'X' || board[piece] != 'O'
end

def computer_choice(board)
  
end

test_board = ['X','O','X','O','X','X','X','O','X']
#test_board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
board = initialize_board

display_table(board)
p board
prompt "Welcome to Tic, Tac, Toe!"
current_player = select_first_player
prompt "#{current_player} goes first!"

loop do 

  
  if current_player == 'Player'
    player_input = ''
    loop do 
      prompt "Select a square numbered 1-9."
      player_input = gets.chomp.to_i - 1
      break if (0..8).include?(player_input)
      prompt "The number needs to be between 0 - 8!"
      puts ''
    end
    place_piece(board,'player',player_input)
    display_table(board)
  else 
    computer_turn(board,'O')
  end
  place_piece(board,'player',player_input)
  display_table(board)
  
  
end
