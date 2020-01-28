require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts " 
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

#Déclaration des joueurs
puts "Quel est ton nom, jeune Padawan"
human_player_name = gets.chomp
my_game = Game.new(human_player_name)

#Game
while my_game.is_still_ongoing? == true
	my_game.show_players
	puts
	choice = my_game.menu
	my_game.menu_choice(choice)
	gets.chomp
	my_game.enemies_attack
	puts "--------------------"
	gets.chomp
	my_game.end
end

binding.pry



