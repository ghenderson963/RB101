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
  if card[2] 
    card[2]
  else
    card[1]
  end
  
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

def display(hand, display_last_card = true)
  hand.each do |card|
    if card == hand[-1]
      if display_last_card
        prompt "a #{resolve_face(card)} of #{resolve_suit(card[0])}. "
      else
        prompt "unknown card."
      end
    elsif card == hand[-2]
      prompt "a #{resolve_face(card)} of #{resolve_suit(card[0])} and "
    else
      prompt "a #{resolve_face(card)} of #{resolve_suit(card[0])}"
    end
  end
end

def deal(deck)
  deck.sample 
end

def twenty_one?(hand)
  total_hand(hand) == 21
end

def bust?(hand)
  total_hand(hand) > 21
end

def detect_result(player, dealer)
  player_total = total_hand(player)
  dealer_total = total_hand(dealer)

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

system "clear"
puts ''
deck = initialize_deck
player_hand = []
dealer_hand = []

# welcome
prompt "Welcome to Twenty-One!"

loop do 
  print "=> dealing"
  3.times do
    print '.'
    sleep 0.25
  end
  puts '.'
  2.times { player_hand << deal(deck) }
  2.times { dealer_hand << deal(deck) }
  
  loop do
    winner = find_winner
    loser =check_for_bust
    break if bust?(dealer_hand) || twenty_one?(dealer_hand)
  
    prompt "You have #{player_hand.length} cards: "
    display(player_hand, true)
    prompt "For a total of -- #{total_hand(player_hand)} -- "
    prompt ''
    prompt "The dealer has a "
    display(dealer_hand, false)
  
    answer = ''
    loop do
      prompt "Would you like to (h)it or (s)tay?"
      answer = gets.chomp.downcase
      break if ['s','h'].include?(answer)
    end
    if answer == 'h'
      player_hand << deal(deck)
      system 'clear'
    else
      break
    end
  end
  
  loop do 
    break if bust?(dealer_hand) || twenty_one?(dealer_hand)
    puts ''
    print "=> The dealer deals themself a card."
    5.times do 
      print '.'
      sleep 0.25
    end
    puts ''
    prompt 'The dealer has: '
    display(dealer_hand)
    dealer_hand << deal(deck)
    sleep 1
    break if total_hand(dealer_hand) > 17
    puts ''
  end

  system 'clear'
  prompt "You have a: "
  display(player_hand)
  prompt "for a total of: #{total_hand(player_hand)}"
  puts ''
  prompt "The dealer has: "
  display(dealer_hand, true)
  prompt "For a total of #{total_hand(dealer_hand)}"
  puts ''

  
  display_results(dealer_hand, player_hand)
  break

end

# how to deal with tie
