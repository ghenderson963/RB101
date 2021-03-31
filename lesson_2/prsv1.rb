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

def players_turn
  display_player_choices
  case gets.chomp
  when '1'
    'paper'
  when '2'
    'rock'
  when '3'
    'scissors'
  end
end

def computer_turn
  ['paper','rock','scissors'].sample
end

players_choice = ''
computers_choice = ''
winner = ''

system "clear"
prompt "Welcome to Paper, Rock, Scissors!"
prompt "You are player1."

players_choice = players_turn
computers_choice = computer_turn

system 'clear'
prompt "You picked #{players_choice}"
prompt "The computer chose #{computers_choice}"

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
