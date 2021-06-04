require 'pry'

WINNING_LINES = [[0,1,2],[3,4,5],[6,7,8],
[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def winner(brd)
  count = 0
  played_tokens = WINNING_LINES.map do |line|
                   count = 0
                   line.select do |sqr|
                     if brd[sqr] == 'X' || brd[sqr] == 'O'
                       count += 1
                     end
                   end
                   return true if count >= 3
                 end
  false
end

board = ['X','X','X',4,5,5,6,7,8,9]
p winner(board)

board = ['X',2,3,4,5,5,6,7,8,9]
p winner(board)