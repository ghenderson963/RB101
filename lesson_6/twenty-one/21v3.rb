require 'pry'

def prompt(msg)
  puts "=> #{msg}"
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

def resolve_face(card)
  card[2] || card[1]
end

def total(hand)
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

def count_aces(hand)
  aces = 0
  hand.each { |card| aces += 1 if card[2] == 'Ace' }
  aces
end

def bust?(hand)
  total(hand) > 21
end

# def total_hand(hand)
#   total = 0
#   aces = count_aces(hand)
#   hand.each do |card|
#     total += card[1] unless card[1] == 11
#   end

#   if aces > 0 && total > 10
#     total + (aces * 1)
#   elsif aces > 0 && total <= 10
#     total += 11
#     total += (aces - 1).times { total += 1 }
#   else
#     total
#   end
# end

def display(hand, display_last_card = true)
  hand.each do |card|
    if card == hand[-1]
      if display_last_card
        prompt "#{resolve_face(card)} of #{resolve_suit(card[0])}. "
      else
        prompt "unknown card."
      end
    elsif card == hand[-2]
      prompt "#{resolve_face(card)} of #{resolve_suit(card[0])} and "
    else
      prompt "#{resolve_face(card)} of #{resolve_suit(card[0])}"
    end
  end
  prompt "For a total of: #{total(hand)}." if display_last_card
end

def deal(deck)
  deck.sample
end

def detect_result(player, dealer)
  player_total = total(player)
  dealer_total = total(dealer)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_results(dealer, player)
  result = detect_result(player, dealer)

  case result
  when :player_busted
    prompt "You busted! Dealer Wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def display_newest_card(card)
  prompt "#{resolve_face(card)} of #{resolve_suit(card[0])}."
end

def twenty_one?(hand)
  total(hand) == 21
end

system "clear"
puts ''
deck = initialize_deck
player_hand = []
dealer_hand = []

prompt "Welcome to Twenty-One!"

print "=> dealing"
3.times do
  print '.'
  sleep 0.25
end
puts '.'
2.times { player_hand << deal(deck) }
2.times { dealer_hand << deal(deck) }

answer = ''
loop do
  if twenty_one?(player_hand) || bust?(player_hand)
    display_results(dealer_hand, player_hand)
    break
  elsif twenty_one?(dealer_hand) || bust?(player_hand)
    display_results(dealer_hand, player_hand)
    break
  else
    prompt "You have a: "
    display(player_hand)
    puts ''
    prompt "The dealer has: "
    display(dealer_hand, false)
    prompt "Do you want to (h)it or (s)tay?"
    answer = gets.chomp.downcase
    break if answer == 's'
  end
  player_hand << deal(deck)
  prompt "The dealer deals a..."
  prompt "#{display_newest_card(player_hand[-1])}"

end


