require 'pry'
require 'byebug'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def list_of_empty_squares(board)
  board.select { |num| num != 'O' && num != 'X' }
end

# def open_squares(arr, brd)
#   arr.select { |num| brd[num] != 'O' && brd[num] != 'X' }
# end

def two_squares_played?(arr, brd, token)
  number = []
  WINNING_LINES.each do |line|
    number << line.select { |square| brd[square] == token } 
  end
  p number
end

# def find_open_square(arr, brd) # takes an arr and returns an int

#   square = open_squares(arr, brd)

#   if square == []
#     return false
#   elsif square.count > 1
#     return false
#   else
#     return square[0]
#   end
# end

def one_square_remaining?(brd)
  brd.count('X') + brd.count('O') == 8
end

def find_available_winning_plays(brd, line, token)
  test = line.select { |square| brd[square] != 'X' && brd[square] != 'O' }
  #byebug
  test
end

def find_random_square(brd)
  brd.select { |square| square != 'X' && square != 'O' }
end

def swap(token)
  token == 'X' ? 'O' : 'X'
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

def defensive_play(brd, token) # return single int

  play_options = []

  WINNING_LINES.each_with_index do |line|
    open_squares = find_available_winning_plays(brd, line, token)
    #binding.pry
    if open_squares.count == 1
      play_options << open_squares.map { |num| brd[num] }
    end
  end
  #binding.pry
  return false if play_options.empty?
  play_options.sample[0] 
end

def check_middle(brd) # return single int
  return 5 if brd[4] == 5
end

def choose_random_square(brd, token) # return single int
  false
end

def find_last_square(board)
    selection = board.select { |square| square != 'X' && square != 'O' }.join.to_i
end

def list_available_squares(brd)
  brd.select { |num| num != 'O' && num != 'X' }
end

def place_token(brd, square, token)
  brd[square - 1] = token
end


def computer_turn(board, token)

 #binding.pry
           if one_square_remaining?(board)
             place_token(board, find_last_square(board), token)
           elsif offensive_play(board, token)
             place_token(board, offensive_play(board, token),token)
           elsif defensive_play(board, swap(token))
            #binding.pry
             place_token(board, defensive_play(board, swap(token)), token)    
            elsif check_middle(board)
              place_token(board, check_middle(board), token)
            else
              place_token(board, find_random_square(board), token )


          #  elsif list_of_empty_squares(board).include?(check_offensive_plays(board, token) - 1)
          #    binding.pry
          #    check_offensive_plays(board, token)
          #  elsif list_of_empty_squares(board).include?(check_defensive_plays(board, token))
          #    check_defensive_plays(board, token)
          #  elsif check_middle(board, token) 
          #    check_middle(board, token)
          #  else
          #    choose_random_square(board, token)
           end
           
#square
end


# last square - test - should return 9
current_player = 'computer'
token = 'O'
#square = 10
board = ['O','O','X','X','O','X','O','O',9]
computer_turn(board,token) 
p board == ['O','O','X','X','O','X','O','O','O']

# middle test - should play square 4
current_player = 'computer'
token = 'O'
board = [1,2,3,4,5,6,7,8,9]
computer_turn(board,token) 
p board == [1,2,3,4,'O',6,7,8,9]

# defensive test. should play 5
current_player = 'computer'
token = 'O'
board = ['X','X',3,4,5,6,7,8,9]
computer_turn(board, token) 
p board == ['X','X',3,4,5,6,7,8,9]

# offensive test. should play 3
current_player = 'computer'
token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
p computer_turn(board, token) #== ['X','X',2,3,4,5,6,7,8]
#p board

# complex test. should play 3
current_player = 'computer'
token = 'O'
board = ['O','O',3,4,5,6,7,'X','X']
p computer_turn(board, token) == ['X','X',2,3,4,5,6,7,8]
#p board

# complex test. should play 7
current_player = 'computer'
token = 'X'
board = ['O','O',3,4,5,6,7,'X','X']
#binding.pry
p computer_turn(board, token) == ['X','X',2,3,4,5,6,7,8]
#p board

# complex defensive test should play 7
current_player = 'computer'
token = 'O'
board = ['O',2,3,4,'O',6,7,'X','X']
#byebug
computer_turn(board, token) #== ['X','X',2,3,4,5,6,7,8]
p board




# token = 'X'
# board = ['X','X',3,4,5,6,7,8,9]
# square = computer_turn(board, token)
# binding.pry
# place_token(board, square, token)
# p board
# arr = [1,'X','X']
# p find_open_square(arr)

# check for middle, last open square, offensive, defensive, random
# each check should take the board, token and use winning_lines and open_squares to return an int on the board or 100
# each square should be checked that it is open before being sent to place_piece 
#  place_piece should place the piece on the board and return nothing

# offense
# 
# iterate the board through winning_lines and find where we have played 2 of our tokens
#   for each line in winning tokens put the index in the board and see if it returns a player token
#   if it does use select to go through that line again and grab the number that isn't an 'x'
#   if it is one of their tokens skip it and move to the next iteration.
#   return the number
# if we have played 2 in a winning line return the single square number.

# defense
# iterate through winning_lines and find where they have played 2 of their tokens
# if they have played 2 of their tokens return the open square.

[[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def offensive_move(brd, token)
  sorted_board = {'X' => [], 'O' => [], 'E' => []}
  brd.each do |square|
    if brd[square] == 'X'
      sorted_board['X'] = square
    elsif brd[square] == 'O'
      sorted_board['O'] = square
    else
      sorted_board['E'] = square
    end


    potential_plays = line.select do |square|
                        brd[square] == token
                      end

  
