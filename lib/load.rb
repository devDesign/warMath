require './db'

class Load
	class << self
		def load_game
			if PlayerDb.get(1) != nil
				DataMapper.finalize
				$player = PlayerDb.get(1).player
				puts "Game loaded.\n".blue
	 		else
	 			puts "No game to load...\n".red
	 		end
		end
	end
end