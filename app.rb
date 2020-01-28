require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 || player2.life_points > 0
	puts "Voici l'état de chaque joueur :"
	print player1.show_state
	puts player2.show_state


	puts "Passons à la phase d'attaque :"
	player1.attacks(player2)
	if player2.life_points <= 0 then break end
	player2.attacks(player1)
	if player1.life_points <= 0 then break end
	puts "----------------------"
end

puts 
if player1.life_points <= 0
	puts "&&&&&&&&&&&&"
	puts "#{player1.name} a été tué"
elsif player2.life_points <= 0
	puts "&&&&&&&&&&&&"
	puts "#{player2.name} a été tué"
end
		


binding.pry