puts "This is the classic rock, paper, scissors game, you will be playing against the computer."
puts "As a reminder, rock smashes scissors, scissors cut paper, and paper covers rock."
puts
puts "You will be prompted for a selection on the screen."
puts "Enter 'r' for rock, 's' for scissors, and 'p' for paper."
puts "Your entry will be compared against the computer's selection a winner for the round will be declared."
puts "You will be asked to play again or end the game."
puts

user = ''
quit = ''
loop do

  loop do
    puts "Make your selection rock: r, scissors: s, paper: p"
    user = gets.downcase.chomp
    break if ['r', 'p', 's'].include?(user)
    puts "Oops ... maybe you made an incorrect entry?  Try again."
  end
  computer = ['r', 'p', 's'].sample

  case 
  when computer == 'r' && user == 's'
    puts "Computer's rock crushes your scissors, computer wins!!"
  when user == 'r' && computer == 's'
    puts "Your rock crushes computer's scissors, you win!!"
  when computer == 's' && user == 'p'
    puts "Computer's scissors cuts your paper, computer wins!!"
  when user == 's' && computer == 'p'
    puts "Your scissors cuts computer's paper, you win!!"
  when computer == 'p' && user == 'r'
    puts "Computer's paper covers your rock, computer wins!!"
  when user == 'p' && computer == 'r'
    puts "Your paper covers computer's rock, you win!!"
  else
    puts "A tie, nobody wins!!"
  end

  loop do
    puts "Do you want to play another round? (y/Y) or (n/N)"
    quit = gets.downcase.chomp
    break if (quit == 'n' || quit == 'y')
    puts "Oops .. maybe you made an incorrect entry?  Try again."
  end

  break if quit == 'n'

end
