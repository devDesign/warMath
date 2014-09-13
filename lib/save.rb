require './db'

class Save
	class << self
		def save_game
			DataMapper.finalize
			if PlayerDb.get(1) != nil
				player = PlayerDb.get(1)
	 			player.destroy
	 		end
			PlayerDb.create(:id => 1 , :player => $player)
			player = PlayerDb.get(1)
			puts "Game saved.\n".green
		end
	end
end