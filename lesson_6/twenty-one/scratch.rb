# welcome player to 21
# create a deck of cards
# deal 2 cards to player
# deal 2 cards to the dealer
# total the cards
# check for 21
# display the players cards
# display the dealers cards but only display the first one
# Ask the player if they would like to hit or stay
# if they hit 
#   deal them a card
#   total their cards
#   display their total
#   Ask if they would like to hit or stay
# if they stay
#   total their cards
#   check if they've busted or have 21
# dealers turn
# 

def check_hit_stay(player)
  prompt "Do you want to (h)it or (s)tay?"
  answer = 
  gets.chomp.downcase
end

def game_ending_state(dealer, player)
  [dealer, player].select do |hand|
    twenty_one?(hand) || bust?(hand)
  end

game_play(dealer, player, deck)
  current_player = player 
  if !game_ending_state(dealer, player).empty?
    display_results(dealer, player)
    break
  else
    display(player)
    display(dealer)
    answer = check_hit_stay(player) if current_player == player


end
