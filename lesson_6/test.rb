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
# 1. check if any of the winning plays is close by seeing if 2 of the 3 squares are played.
#    a. break all the winning triples up into sub arrays.
#       i. 
#    b. return all the sub arrays that have 2 plays.
# 2. if 2 of the 3 are played play the first open square.
# 3. 

if board[i] == 'X' && board[i + 1] == 'X'
  next unless square_free?(board, board[i + 2 ])