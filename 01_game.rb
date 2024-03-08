class Game

	def initialize(player_1, player_2)
		@current_player = 0
		@players = [Player.new(player_1), Player.new(player_2)]
	end

	def reverse_current
		if @current_player == 0
			@current_player = 1
		else
			@current_player = 0
		end
	end

	def start_turn
		num1 = 1 + rand(19)
		num2 = 1 + rand(19)
		question = [num1, num2, num1 + num2]

		puts "Player #{@players[@current_player].name}: What does #{question[0]} + #{question[1]} equal?"
		print ">"
		player_answer = $stdin.gets.chomp

		if (player_answer != "#{question[2]}")
			# subtract current player life
			puts "Player #{@players[@current_player].name}: Seriously? No!"

			@players[@current_player].lives -= 1

			if @players[@current_player].lives <= 0
				reverse_current
				
				puts "Player #{@players[@current_player].name} wins with a score of #{@players[@current_player].lives}/3"
				puts "----- GAME OVER -----"
				puts "Good bye!"
				exit(0)
			else
				puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
			end
			
			puts "--- NEW TURN ---"
		else
			puts "Player #{@players[@current_player].name}: Yes! You are correct."
			puts "--- NEW TURN ---"
		end
		
		reverse_current
		self.start_turn
	end
end