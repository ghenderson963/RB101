require 'pry'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def list_of_empty_squares(board)
  board.select { |num| num != 'O' && num != 'X' }
end

def open_squares(arr, brd)
  arr.select { |num| brd[num] != 'O' && brd[num] != 'X' }
end

def two_squares_played?(arr, brd, token)
  number = arr.select { |square| brd[square] == token } 
  number.count == 2
end

def find_open_square(arr, brd) # takes an arr and returns an int

  square = open_squares(arr, brd)

  if square == []
    return false
  elsif square.count > 1
    return false
  else
    return square[0]
  end
end

def check_offensive_plays(brd,token) # return single int
  # set the token to computer's token
  # iterate through winning_lines
  # for each sub-array in winning lines count the number of squares filled in with computer's symbol
  # if the count equals 2 find which index is open
  # return the open square
  square = []
  WINNING_LINES.each_with_index do |winning_line, indx|
    

    if two_squares_played?(winning_line, brd, token)
      square << find_open_square(winning_line, brd)
    end
  end
  binding.pry
  square[0]
  #   board[winning].count(token) == 2
  #     square = find_open_square(winning_line)
      
  #     if 
      
      
  #     count(token) == 2
  #     square = find_open_square(winning_line)
  #   end
  #   return square 
  # end
  # false

end

def check_defensive_plays(brd, token) # return single int
 false
end

def check_middle(brd, token) # return single int
  false
end

def choose_random_square(brd, token) # return single int
  false
end

def check_last_square(brd)
  false
end

# def open_squares(brd, token) # return arr of open squares
#   [2,3,4,5,6,7,8]
# end

def place_token(brd, square, token)
  brd[square] = token
end


def computer_turn(board, token)
  binding.pry
  square = if check_last_square(board)
             check_last_square(board)
           elsif list_of_empty_squares(board).include?(check_offensive_plays(board, token) - 1)
             binding.pry
             check_offensive_plays(board, token)
          #  elsif list_of_empty_squares(board).include?(check_defensive_plays(board, token))
          #    check_defensive_plays(board, token)
          #  elsif check_middle(board, token) 
          #    check_middle(board, token)
          #  else
          #    choose_random_square(board, token)
           end
           
square
end

token = 'X'
board = ['X','X',3,4,5,6,7,8,9]
square = computer_turn(board, token)
binding.pry
place_token(board, square, token)
p board
# arr = [1,'X','X']
# p find_open_square(arr)