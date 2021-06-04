


def find_available_winning_plays(brd, line, token)
  test = line.select { |square| brd[square] != 'X' && brd[square] != 'O' }
  #byebug
  test
end


token = 'O'
board = ['O','O',3,4,5,6,7,8,9]
line = [0,1,2]
p find_available_winning_plays(board, line, token)

board = ['O','O',3,4,5,6,7,8,9]
line = [0,1,2]
p find_available_winning_plays(board, line, token)

board = [1,3,4,5,6,7,'O','O']
line = [6,7,8]
p find_available_winning_plays(board, line, token)