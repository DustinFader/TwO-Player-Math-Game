class Game
	attr_writer :current_player

	def initial
		@players = []
		@current_player = 0
	end

	print ">"
	player_answer = $stdin.gets.chomp
end