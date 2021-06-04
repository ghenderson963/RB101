require 'pry'

WINNING_LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                 [0, 3, 6], [1, 4, 7], [2, 5, 8],
                 [0, 4, 8], [2, 4, 6]]

def prompt(message)
  puts "==> #{message}"
end

def display_table(board)
  system("clear")

  puts "                             "
  puts "          |       |          "
  puts "      #{board[0]}   |   #{board[1]}   |  #{board[2]}         "
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
  ['Player', 'Computer'].sample
end

def initialize_board
  new_board = []
  (1..9).map { |num| new_board[num] = num }
end

def pick_computer_token(player_token)
  player_token == 'X' ? 'O' : 'X'
end

def choose_token
  loop do
    puts ''
    prompt "Would you like to be Xs or Os?"
    player_piece = gets.chomp
    return player_piece if ['X', 'O'].include?(player_piece)
    prompt "Please choose an X or an O."
  end
end

def swap(token)
  token == 'X' ? 'O' : 'X'
end

def clean_selections(options)
  options.select { |sqr| sqr[0] != 'X' && sqr[0] != 'O' }
end

# refine
def list_of_empty_indices(brd)
  squares = brd.select { |num| num != 'O' && num != 'X' }
  squares.map { |num| num - 1 }
end

def list_of_empty_squares(brd)
  brd.select { |num| num != 'O' && num != 'X' }
end

def board_full?(board)
  board.count('X') + board.count('O') == 9
end

def last_square(brd)
  square = brd.select { |sqr| sqr != 'X' && sqr != 'O' }
  return square.join.to_i if square.count == 1
  return false if square.count > 1
end

def square_free?(board, square)
  board[square] != 'X' && board[square] != 'O'
end

def find_available_winning_plays(brd, line, token)
  line.select { |square| brd[square] != token }
end

def two_squares_played(brd, token)
  play_options = []

  WINNING_LINES.each do |line|
    open_squares = find_available_winning_plays(brd, line, token)

    if open_squares.count == 1
      play_options << open_squares.map { |num| brd[num] }
    end
  end

  play_options = clean_selections(play_options)
  return false if play_options.empty?
  play_options.sample.join.to_i
end

def check_middle(brd) # return single int
  return 5 if brd[4] == 5
end

def random_square(brd)
  loop do
    square = brd.sample
    return square if list_of_empty_squares(brd).include?(square)
  end
end

def current_player_turn(board, current_player, token)
  if current_player == 'Player'
    player_turn(board, token)
  else
    computer_turn(board, token)
  end
end

def switch_player(player)
  player == 'Player' ? 'Computer' : 'Player'
end

def place_piece(brd, sqr, token)
  brd[sqr - 1] = token
  sqr
end

def joinor(brd, separator, conjunction = 'and')
  brd.each do |num|
    if brd.index(num) == brd.length - 1
      puts "#{conjunction} #{num} "
    else
      print "#{num}#{separator} "
    end
  end
end

def player_turn(brd, token)
  square = ''
  loop do
    print "Select a square numbered "
    joinor(list_of_empty_squares(brd), ',')
    square = gets.chomp.to_i
    break if list_of_empty_indices(brd).include?(square - 1)
    prompt "That is not a valid choice!"
    puts ''
  end
  brd[square - 1] = token
  square
end

def computer_turn(brd, token)
  if last_square(brd)
    place_piece(brd, last_square(brd), token)
  elsif two_squares_played(brd, token)
    place_piece(brd, two_squares_played(brd, token), token)
  elsif two_squares_played(brd, swap(token))
    place_piece(brd, two_squares_played(brd, swap(token)), token)
  elsif check_middle(brd)
    place_piece(brd, check_middle(brd), token)
  else random_square(brd)
    place_piece(brd, random_square(brd), token)
  end
end

def winner?(brd, token)
  count = 0

  WINNING_LINES.map do |line|
    count = 0
    line.select do |sqr|
      count += 1 if brd[sqr] == token
    end
    return true if count >= 3
  end
  false
end

loop do
  system("clear")
  prompt "Welcome to Tic Tac Toe!"
  current_player = pick_first_player
  player_token = choose_token
  computer_token = pick_computer_token(player_token)
  token = if current_player == 'Player'
            player_token
          else
            computer_token
          end

  prompt "You are #{player_token}s. The computer is #{computer_token}."
  prompt "Choosing who goes first...."
  5.times do
    sleep 0.1
    print '.'
  end
  puts '.'
  prompt "#{current_player} goes first!"
  sleep 2

  board = initialize_board
  display_table(board)
  square = 10
  loop do
    square = current_player_turn(board, current_player, token)
    break if winner?(board, token) || board_full?(board)

    sleep 1
    display_table(board)
    prompt "#{current_player} chooses to play square #{square} with #{token}."

    sleep 1
    current_player = switch_player(current_player)
    token = if current_player == 'Player'
              player_token
            else
              computer_token
            end
    sleep 0.5
  end

  display_table(board)
  puts ''

  if board_full?(board)
    prompt "Looks like it is a tie!"
  else
    prompt "#{current_player} wins!"
  end

  puts ''
  prompt "Want to play again? (N)o or (Y)es."
  play_again = gets.chomp.upcase
  break if play_again == 'N'
end
