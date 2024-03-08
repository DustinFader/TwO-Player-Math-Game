require './01_game'
require './02_player'

print"Player One Name?>"
player_1 = $stdin.gets.chomp
print"Player Two Name?>"
player_2 = $stdin.gets.chomp
game_instance = Game.new(player_1, player_2)

game_instance.start_turn