class Game

	def initialize()
		@@current_player = 0

		print"Player One Name? >"
		player_1 = $stdin.gets.chomp
		print"Player Two Name? >"
		player_2 = $stdin.gets.chomp
		@@players = [Player.new(player_1), Player.new(player_2)]
	end

	# determines which players turn
	def reverse_current
		if @@current_player == 0
			@@current_player = 1
		else
			@@current_player = 0
		end
	end

	def start_turn
		num1 = 1 + rand(19)
		num2 = 1 + rand(19)
		question = [num1, num2, num1 + num2]

		puts "Player #{@@players[@@current_player].name}: What does #{question[0]} + #{question[1]} equal?"
		print ">"
		player_answer = $stdin.gets.chomp

		if (player_answer != "#{question[2]}")
			# subtract current player life when wrong
			puts "Player #{@@players[@@current_player].name}: Seriously? No!"
			
			@@players[@@current_player].lives -= 1

			if @@players[@@current_player].lives <= 0
				game_over
			else
				puts "P1: #{@@players[0].lives}/3 vs P2: #{@@players[1].lives}/3"
			end
			
			puts "--- NEW TURN ---"
		else
			puts "Player #{@@players[@@current_player].name}: Yes! You are correct."
			puts "--- NEW TURN ---"
		end
		
		# turn loop
		reverse_current
		self.start_turn
	end

	def game_over
		reverse_current
				
		puts "Player #{@@players[@@current_player].name} wins with a score of #{@@players[@@current_player].lives}/3"
		puts "----- GAME OVER -----"
		puts "Good bye!"
		exit(0)
	end
end