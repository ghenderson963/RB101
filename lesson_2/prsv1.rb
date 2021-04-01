# user makes a choice
# the computer makes a choice
# the winner is displayed

def prompt(msg)
  puts "==> #{msg}"
end

def display_player_choices
  player_prompt = <<~MSG
                  Select your choice from below?
                  1) Paper
                  2) Rock
                  3) Scissor
  MSG
  prompt(player_prompt)
end

def validate_choice(number)
  ['1', '2', '3'].include?(number)
end

def convert_number_to_prs(choice)
  case choice
  when '1'
    'paper'
  when '2'
    'rock'
  when '3'
    'scissors'
  end
end

def players_turn
  choice = ''
  loop do
    display_player_choices
    choice = gets.chomp
    break if validate_choice(choice)
    system "clear"
    prompt "Come on.  It's paper, rock, scissors."
    prompt "Select a number 1 - 3. It's not hard."
  end

  convert_number_to_prs(choice)
end

def computer_turn
  ['paper', 'rock', 'scissors'].sample
end

winner = ''

system "clear"
prompt "Welcome to Paper, Rock, Scissors!"
prompt "You are player1."

loop do
  players_choice = players_turn
  computers_choice = computer_turn

  system 'clear'
  prompt "You picked #{players_choice}."
  prompt "The Computer chose #{computers_choice}."

  if players_choice == 'scissors' && computers_choice == 'paper'
    winner = 'player1'
  elsif players_choice == 'rock' && computers_choice == 'scissors'
    winner = 'player1'
  elsif players_choice == 'paper' && computers_choice == 'rock'
    winner = 'player1'
  elsif players_choice == 'rock' && computers_choice == 'paper'
    winner = 'computer'
  elsif players_choice == 'scissors' && computers_choice == 'rock'
    winner = 'computer'
  else
    puts "it's a tie."
  end

  prompt "The #{winner.capitalize} is the winner!" if winner == 'computer'
  prompt "You win!!!!" if winner == 'player1'
  prompt ''
  prompt "Would you like to play again? (Y)es or (N)o?"
  break unless ['y', 'yes'].include?(gets.chomp.downcase)
end
