require 'pry'

def prompt(msg)
  puts "==> #{msg}"
end

def initialize_deck
  deck = []
  
  (1..4).each do |suit|
    (1..9).each do |num|
     deck << [suit, num]
    end
    deck << [suit,'Jack',10] << [suit, 'King',10] << [suit, 'Queen', 10] << [suit, 'Ace', 11]
  end
  deck
end

def face_cards(card)
  ['king','queen', 'jack'].sample
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

def card_value(card)
  case card
  when 'Jack'
    10
  when 'Queen' 
    10
  when 'King'
    10
  when 'Ace'
    11
  else
    card 
  end
end

def deal_card(deck)
  deck.sample
end

def display_hand(hand, dealer)
  
  hand.each do |card|
    if card == hand[-1]
      if dealer == 2
        puts "unknown card."
        break
      end
      puts "#{card[1]} of #{resolve_suit(card[0])} " if dealer == 1
    else
      print "#{card[1]} of #{resolve_suit(card[0])} and "
    end
  end
    prompt "For a total of #{card_value(hand[0][1]) + card_value(hand[1][1])}. " if dealer == 1
end

def player_turn(deck, hand)
  

end

def twenty_one?(hand)
  
end

  # def display_dealer_hand(dealer_hand)
  #   print "==> The dealer has: "
  #   dealer_hand.each do |card|
  #     if card == dealer_hand[-1]

  # end
  
  
#       prompt "Dealer has: #{dealer_hand[0][1]} of #{resolve_suit(dealer_hand[0][0])} and unknown card."
#  #loop do 
#   prompt "You have: #{player_hand[0][1]} of #{resolve_suit(player_hand[0][0])} and a #{player_hand[1][0]} of #{resolve_suit(player_hand[1][0])}"


deck = initialize_deck
player_hand = []
dealer_hand = []
player_hand << deal_card(deck) << deal_card(deck)
dealer_hand << deal_card(deck) << deal_card(deck)

loop do 
  print "==> You have a: "
  display_hand(player_hand, 1)
  puts ''
  print "==> The dealer has: "
  display_hand(dealer_hand, 2)
  break if twenty_one?(hand) || bust?
  prompt ""
  player_turn(deck, player_hand)
  player_hand << deal_card(deck)
  #display_hand(player_hand, 1)
  