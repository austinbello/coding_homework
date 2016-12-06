def is_number? string
 true if Float(string) rescue false
end

def random_number(min, max)
  [*min..max].sample
end

def repeat?(guess, array_of_guesses)
  array_of_guesses.include? guess
end

def play_again?
  answer = gets.chomp.downcase
  while (['yes', 'no', 'y', 'n'].include? answer) == false
    puts "I don't understand. Please enter 'yes', 'no', 'y', or 'n'"
    answer = gets.chomp.downcase
  end
  return answer
end

def guess_logic(guess, correct, array_of_guesses)
  if (repeat?(guess, array_of_guesses))
    return "Youv\'e already guessed #{guess}. Are you feeling alright?"
  elsif (guess > correct)
    if (array_of_guesses.each_index.select { |n|  [*(correct+1)..(guess-1)].include? array_of_guesses[n]}.length > 0)
      return "Well that was a waste of a guess. Too high again"
    else
      return "Too high"
    end
  elsif (guess < correct)
    if (array_of_guesses.each_index.select { |n|  [*(guess+1)..(correct-1)].include? array_of_guesses[n]}.length > 0)
      return "Well that was a waste of a guess. Too low again"
    else
      return "Too low"
    end
  end
end

def win?(guess, correct, array_of_guesses)
  (array_of_guesses.include? correct) || (guess == correct)
end

def leaderboard(names_scores_hash)
  puts "LEADERBOARD"
  sorted = names_scores_hash.sort_by {|name, score| score}
  sorted.each do |name, score|
    puts "#{name}: #{score}"
  end
end

def user_guessing_game(name, names_scores_hash)
  puts "Welcome to the Guessing Game #{name}. A number has been chosen between 1 and 100. What\'s your first guess?"
  correct_num = String(random_number(1,100))
  already_guessed = []
  guess = gets.chomp

  while guess != correct_num && already_guessed.length < 9
    if (is_number?(guess))
      puts guess_logic(guess.to_i, Integer(correct_num), already_guessed) + " (#{(9-already_guessed.length)} #{(9-already_guessed.length) == 1 ? 'guess' : 'guesses'} remaining)"
      already_guessed << guess.to_i
      guess = gets.chomp
    else
      puts "Please enter only integers between 1 and 100" + " (#{(10-already_guessed.length)} #{(10-already_guessed.length) == 1 ? 'guess' : 'guesses'} remaining)"
      guess = gets.chomp
    end
  end

  if (win?(guess, correct_num, already_guessed))
    puts "That's right! Congrats you win!"
  else
    puts "Sorry, you're out of guesses. The correct number was #{correct_num}"
  end
  return names_scores_hash.merge!(name => already_guessed.length)
end

def user_guessing_game_w_leaderboard
  play_again = 'yes'
  leaderboard_hash = {}

  while (play_again == 'yes' || play_again == 'y')
    puts "What's your name?"
    username = gets.chomp
    leaderboard_hash = user_guessing_game(username, leaderboard_hash)
    leaderboard(leaderboard_hash)
    puts "Would someone else like to play? (Y/N)"
    play_again = play_again?()
  end
end

def computer_guess(min, max, guess_num)
  if guess_num < 4
    (min + max) / 2
  else
    random_number(min, max)
  end
end

def ordinal(number)
  if number == 1
    number.to_s + 'st'
  elsif number == 2
    number.to_s + 'nd'
  elsif number == 3
    number.to_s + 'rd'
  else
    number.to_s + 'th'
  end
end

def computer_guessing_game
  guesses = []
  input = ''
  lo = 1
  hi = 100

  while input != 'correct' && guesses.length < 5
    comp_guess = computer_guess(lo, hi, guesses.length)
    guesses << comp_guess
    puts "My #{ordinal(guesses.length)} guess is #{comp_guess}"
    input = gets.chomp.downcase
    while input != 'low' && input != 'high' && input != 'correct'
      puts "I don't understand. Please enter 'low', high' or 'correct'"
      input = gets.chomp.downcase
    end
    if input == 'low'
      lo = comp_guess + 1
    elsif input == 'high'
      hi = comp_guess - 1
    end
  end

  if input == 'correct'
    puts 'I am the greatest!'
  elsif hi < lo
    puts 'I call BS. Cheaters never win.'
  else
    puts 'You got me this time'
  end
end

def computer_guessing_game_w_repeat
  play_again = 'yes'

  while play_again == 'yes' || play_again == 'y'
    computer_guessing_game()
    puts "Would you like me to guess again? (Y/N)"
    play_again = play_again?()
  end
end

puts "Which game would you like to play?"
puts "1. I choose, you guess"
puts "2. You choose, I guess"
play_again = 'yes'
game_type = gets.chomp

while game_type != "1" && game_type != "2"
  puts "Thats not a game option. Please enter '1' or '2'"
  game_type = gets.chomp
end

while play_again == 'yes' || play_again == 'y'
  if game_type == "1"
    user_guessing_game_w_leaderboard()
    puts "Would you like me to try to guess? (Y/N)"
    play_again = play_again?()
    if play_again == 'yes' || play_again == 'y'
      game_type = "2"
    end
  elsif game_type == "2"
    computer_guessing_game_w_repeat()
    puts "Would you like to try to guess? (Y/N)"
    play_again = play_again?()
    if play_again == 'yes' || play_again == 'y'
      game_type = "1"
    end
  end
end

puts "Thanks for playing!"
