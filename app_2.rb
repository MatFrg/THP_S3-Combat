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
human_player = HumanPlayer.new(human_player_name)

ennemies = Array.new
ennemies = [player1 = Player.new("Josiane"), player2 = Player.new("José")]

puts
puts "Bienvenue #{human_player_name}, tu affronteras #{player1.name} et #{player2.name} dans un combat sans merci"
gets.chomp

#Présentation des actions
while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
	puts human_player.show_state
	puts
	puts "Quelle action veux-tu effectuer"	
	puts "a - chercher une meilleure arme"
	puts "s - chercher à se soigner"
	puts 
	puts "attaquer un joueur en vue :"
	print "0 - "
				if player1.life_points > 0  # Si le joueur a encore des points de vie il est affiché. Autrement il est indiqué comme mort.
				puts "#{player1.show_state} "
				else 
				puts " #{player1.name} is dead"	
				end
	print "1 - "
				if player2.life_points > 0 # Si le joueur a encore des points de vie il est affiché. Autrement il est indiqué comme mort.
				puts "#{player2.show_state} "
				else
				puts "#{player2.name} is dead"
				end

	print ">"
	choice = gets.chomp

#sélection de l'action
	if choice == "a"  
		human_player.search_weapon #recherche d'une nouvelle arme
	elsif choice == "s"
		human_player.search_health_pack #recherche d'un pack de soin
	elsif choice == "0"
		human_player.attacks(player1)
		if player1.life_points <= 0 # Si le joueur meurt pendant l'attaque, on l'indique
		puts "&&&&&&&&&&&&"
		puts "#{player1.name} a été tué"
		else
		end
	elsif choice == "1"
		human_player.attacks(player2)
		if player2.life_points <= 0 # Si le joueur meurt pendant l'attaque, on l'indique
		puts "&&&&&&&&&&&&"
		puts "#{player2.name} a été tué"
		else
		end	
	end
		
	gets.chomp

	puts "Les autres joueurs t'attaquent!"
	ennemies.each do |ennemie|
		if ennemie.life_points <= 0	#Si un jouer est mort, il n'attaque pas
		else  ennemie.attacks(human_player)
		end
	end

	puts "-----------------------"
	gets.chomp
end	

# Fin du Game
puts "La partie est finie"

if human_player.life_points > 0
	puts "BRAVO ! TU AS GAGNE !"
else 
	puts "Loser ! Tu as perdu !"
end

binding.pry