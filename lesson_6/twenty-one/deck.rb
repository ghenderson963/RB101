
def prompt(msg)
  puts "==> #{msg}"
end

def initialize_deck
  deck = []
  
  (1..4).each do |suit|
    (1..11).each do |num|
     deck << [suit, num]
    end
  end
  deck
end

def resolve_suit(card)
  case card
  when 1
    "Hearts"
  when 2
    "Diamonds"
  when 3
    "Spades"
  when 4
    "Clubs"
  end
end

def deal_card(deck)
  deck.sample
end

def display_hands(dealer_hand, player_hand)

  prompt "Dealer has: #{dealer_hand[0][1]} of #{resolve_suit(dealer_hand[0][0])} and unknown card."
 #loop do 
  prompt "You have: #{player_hand[0][1]} of #{resolve_suit(player_hand[0][0])} and a #{player_hand[1][0]} of #{resolve_suit(player_hand[1][0])}"
end
  


deck = initialize_deck
player_hand = []
dealer_hand = []
p deck
player_hand << deal_card(deck) << deal_card(deck)
dealer_hand << deal_card(deck) << deal_card(deck)
p player_hand
display_hands(dealer_hand, player_hand)




# deck needs to be able to be shuffled
# deck should be able to deal cards
# cards need to be able to be summed
# ace has 2 values
# 

[[1,1],[1,2],[1,3],[1,4]]
# jack = 10
# queen = 10
# king = 10
# ace = 2 or 11