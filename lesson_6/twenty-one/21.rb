require 'pry'

def prompt(msg)
  puts "==> #{msg}"
end

def initialize_deck
  deck = []
  
  (1..4).each do |suit|
    (2..10).each do |num|
     deck << [suit, num]
    end
    deck << [suit, 10, 'Jack'] << 
            [suit, 10, 'King'] << 
            [suit, 10, 'Queen'] << 
            [suit, 11, 'Ace']
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

def count_aces(hand)
  aces = 0
  hand.each { |card| aces += 1 if card[2] == 'Ace' }
  aces
end

def total_hand(hand)
  total = 0
  aces = count_aces(hand)
  hand.each do |card|
    total += card[1] unless card[1] == 11
  end

  if aces > 0 && total > 10
    total + (aces * 1)
  elsif aces > 0 && total <= 10
    total += 11
    total += (aces - 1).times { total += 1 }
  else
    total
  end
end

def twenty_one?(hand)
  total_hand(hand) == 21
end

def bust?(hand)
  total_hand(hand) > 21
end

def display_hand(hand, dealer)
  hand.each do |card|
    if card == hand[-1]
      if dealer >= 2
        print "unknown card."
        break
      end
      puts "#{card[1]} of #{resolve_suit(card[0])} " if dealer == 1
    else
      print "==> #{card[1]} of #{resolve_suit(card[0])} and "
    end
  end
    prompt "For a total of #{total_hand(hand)}. " if dealer == 1
end

def display_card(card)
  prompt "The dealer delt a #{card[1]} of #{resolve_suit(card[0])}"

end

def dealer_turn(deck, hand)
  loop do 
    return hand if total_hand(hand) >= 16
    binding.pry
    hand << deal_card(deck)
  end

end


loop do 

  deck = initialize_deck
  dealer_hand = []
  player_hand = []
  dealer_hand << deal_card(deck) << deal_card(deck)
  player_hand << deal_card(deck) << deal_card(deck)
  
  answer = ''
  loop do 
    prompt "You have a: "
    display_hand(player_hand, 1)
    prompt "The dealer has: " 
    display_hand(dealer_hand, 2)
    break if twenty_one?(player_hand) || bust?(player_hand)
  
    2.times { puts '' }
    prompt "Hit or Stay?"
    puts ''
    answer = gets.chomp
   # binding.pry
    break if bust?(player_hand) || answer == 'stay' || twenty_one?(player_hand)
    player_hand << deal_card(deck)
    display_card(player_hand[-1])
  end
  binding.pry
  if bust?(player_hand)
    prompt "You busted.  Play again? (y)es or (n)o?"
    answer = gets.chomp.downcase
    break if answer == 'n'
  elsif answer == 'stay'
    prompt "You chose to stay."
    dealer_turn(deck, dealer_hand)
    prompt "The dealer stays with: #{display_hand(dealer_hand, 1)}"
  else
    prompt "You chose to hit."

  end

end

# p twenty_one?(hand)
# p total_hand(hand)
# p bust?(hand)
# display_hand(hand, dealer_hand.count)

# initialize the deck
# deal 2 cards to player
# display the cards and total
# deal 2 cards to dealer
# display the cards - hiding one of the dealer's cards
# check that the player or dealer haven't busted or got 21
# ask the player if they would like to hit or stay
# if they stay
#   dealers turn
# if they hit
#   deal a card
# 
# 
# loop do 
#   break if twenty_one?(hand) || bust?(hand)
#   display_the_cards
#   ask the player if they would like to stay or hit
#   if hit
#     prompt "You chose to hit."
#     sleep 1
#     display_card(deal_card(deck))
#   if stay
#     prompt "You chose to stay."
#     
#   end