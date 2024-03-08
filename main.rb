require './02_player'
require './01_game'

def game
  player_1 = Player.new(1)
  player_2 = Player.new(2)
  players = [player_1, player_2]

  game_instance = Game.new

  while true
    num1 = 1 + rand(19)
    num2 = 1 + rand(19)
    question = [num1, num2, num1 + num2]

    puts "Player #{players[game_instance.current_player].name}: What does #{question[0]} + #{question[1]} equal?"
    print ">"
    player_answer = $stdin.gets.chomp


    if (player_answer != "#{question[2]}")
      # subtract current player life
      puts "Player #{players[game_instance.current_player].name}: Seriously? No!"

      players[game_instance.current_player].lives -= 1

      
      if players[game_instance.current_player].lives <= 0
        if game_instance.current_player == 0
          game_instance.current_player = 1
        else
          game_instance.current_player = 0
        end
        
        puts "Player #{players[game_instance.current_player].name} wins with a score of #{players[game_instance.current_player].lives}/3"
        puts "----- GAME OVER -----"
        puts "Good bye!"
        exit(0)
      else
        puts "P1: #{players[0].lives}/3 vs P2: #{players[1].lives}/3"
      end
      
      puts "--- NEW TURN ---"
    else
      puts "Player #{players[game_instance.current_player].name}: Yes! You are correct."
      puts "--- NEW TURN ---"
    end
    
    if game_instance.current_player == 0
      game_instance.current_player = 1
    else
      game_instance.current_player = 0
    end
  end
end

game