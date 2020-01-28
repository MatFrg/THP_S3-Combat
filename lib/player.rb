class Player
	attr_accessor :life_points
	attr_accessor :name

	def initialize(name_to_save)
		@life_points = 10
		@name = name_to_save
	end

	def show_state
		"#{name} a #{life_points} points de vie"
	end

	def gets_damage(damage)
		@life_points = @life_points - damage
		if @life_points <= 0
			puts "le joueur #{name} a été tué "
		else
			puts "#{name} a #{life_points} points de vie"
		end
	end

	def attacks(player_attacked)
		puts "Le joueur #{name} attaque le joueur #{player_attacked.name}"
		damage = compute_damage
		player_attacked.life_points = player_attacked.life_points - damage
		puts "il lui inflige #{damage} points de dommages"
	end

	def compute_damage
		return rand(1..6)
	end

end


class HumanPlayer < Player
	attr_accessor :weapon_level
	attr_accessor :life_points
	attr_accessor :name

	def initialize (name_to_save)
		@life_points = 100
		@weapon_level = 1
		@name = name_to_save
	end

	def show_state
			puts "#{name} a #{life_points} points de vie et un niveau d'arme #{weapon_level}"
	end

	def compute_damage
		rand(1..6)*@weapon_level
	end

	def search_weapon
	new_weapon = rand(1..6)
	puts "Tu as trouvé une arme de niveau #{new_weapon}"
		if new_weapon > @weapon_level
			@weapon_level = new_weapon
			puts  "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end
	
	def search_health_pack
		health_random = rand(1..6)
		if health_random == 1
			puts "Tu n'as rien trouvé... "
		elsif 2 <= health_random  && health_random <= 5 
			@life_points = @life_points + 50
			puts "Bravo, tu as trouvé un pack de +50 points de vie !"
		elsif health_random == 6 
		@life_points = @life_points + 80
		puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end
	end
end


