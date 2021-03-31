# user makes a choice
# the computer makes a choice
# the winner is displayed


def prompt(msg)
  puts "==> #{msg}"
end

def display_running_dots(sleep_length)
  sleep_length.times do
    print '.'
    sleep 1
  end
  puts '.'
end

def who_goes_first
  [:player1, :computer].sample
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
  gets.chomp
end

def computer_turn

end

def switch_player(player)
  player = 'computer' if player = 'player1'
  player = 'player1' if player = 'computer'  
end

system "clear"
prompt "Welcome to Paper, Rock, Scissors!"
prompt "You are player1."
prompt "Rolling dice to see who goes first."
display_running_dots(3)
current_player = who_goes_first.to_s
prompt  "#{current_player.capitalize} goes first!"

loop do
  if current_player == 'player1'
    players_choice = players_turn
  else
    computers_choice = computer_turn
  end
  current_player = switch_player(current_player)
  break
end





