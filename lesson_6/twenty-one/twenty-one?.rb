require 'pry'

def initialize_deck
  deck = []
  
  (1..4).each do |suit|
    (2..9).each do |num|
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

def total_hand(hand)
  total = 0
  aces = 0
  hand.each do |card|
    if card.length == 3 && card[2] == 'Ace'
      aces += 1
    else
      total += card[1]
    end
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

hand = [[1,10],[3,11,'Ace']]
p twenty_one?(hand)
p total_hand(hand)

hand = [[2,10,'Jack'],[3,4],[4,7]]
p twenty_one?(hand)
p total_hand(hand)

hand = [[1,4],[2,6],[4,10,'Jack']]
p twenty_one?(hand)
p total_hand(hand)

hand = [[1,11,'Ace'],[2,11,'Ace'],[4,6]]
p twenty_one?(hand)
p total_hand(hand)

deck = initialize_deck
player_hand = []
player_hand << deal_card(deck) << deal_card(deck) << deal_card(deck)
p player_hand
p twenty_one?(player_hand)
p total_hand(player_hand)

p deck.length


#ace
# if total > 10 ace == 2