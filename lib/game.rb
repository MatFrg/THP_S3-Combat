class Game  
	attr_accessor :human_player
	attr_accessor :enemies
	attr_accessor :life_points
	@enemies = Array.new 

	

	def initialize(name_to_save)
		@human_player = HumanPlayer.new(name_to_save)
		@enemies = [player1 = Player.new("Josiane"), player2 = Player.new("José"), player3 = Player.new("Joseph"), player4 = Player.new("Josette")]
	end

	def kill_player(player) #retire un joueur de l'array
		if player.life_points <= 0 then enemies.delete(player) end
	end

	def is_still_ongoing? #test si le jeu continue 
		if human_player.life_points > 0 && enemies.empty? == false  then return true end
	end

	def show_players #info sur les joueurs
		human_player.show_state
		puts "Nombre d'ennemies restant #{@enemies.count}"
	end

	def menu #affiche les actions possible et récupère le choix du joueur
		puts "Quelle action veux-tu effectuer?"	
		puts "a - chercher une meilleure arme"
		puts "s - chercher à se soigner"
		puts 
		puts "attaquer un joueur en vue :"
		if @enemies.include?enemies[0]  # Les joueurs sont affichés uniquement si ils se trouve dans l'array
			print "0 - "
			puts "#{@enemies[0].show_state} "
		else 
		end
		if @enemies.include?enemies[1] 
			print "1 - "
			puts "#{@enemies[1].show_state} "
		else
		end
		if @enemies.include?enemies[2] 
			print "2 - "
			puts "#{@enemies[2].show_state} "
		else
		end
		if @enemies.include?enemies[3] 
			print "3 - "
			puts "#{@enemies[3].show_state} "
		else
		end

		print ">"
		choice = gets.chomp
	end

	def menu_choice(choice) #lance l'action du tour selon le choix du joueur
		if choice == "a"  
			human_player.search_weapon #recherche d'une nouvelle arme
		elsif choice == "s"
			human_player.search_health_pack #recherche d'un pack de soin
		else
			target = enemies[choice.to_i]
			human_player.attacks(target)
			if target.life_points <= 0 
				puts "#{target.name} est en pls"
				kill_player(target)
			end
		end
	end

	def enemies_attack #lance l'attaque uniquement si il y a encore des ennemies
		if enemies.empty? == false
			puts "Les autres joueurs t'attaquent!"
			@enemies.each do |enemie|
				if enemie.life_points <= 0	#Si un joueur est mort, il n'attaque pas
				else  enemie.attacks(human_player)
				end
			end
		end
	end

	def end #message de fin
		if enemies.empty? == true || human_player.life_points <= 0
			puts "La partie est finie"
			if human_player.life_points > 0
				puts "BRAVO ! TU AS GAGNE !"
			else 
				puts "Loser ! Tu as perdu !"
			end
		else
		end
	end

end