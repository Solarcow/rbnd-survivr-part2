class Game
	attr_reader :tribes

	def initialize(tribe_1, tribe_2)
		@tribes = [tribe_1, tribe_2]
	end
	def add_tribe(tribe)
		@tribes << tribe
	end
	def immunity_challenge
		@tribes.sample
	end
	def clear_tribes
		@tribes.clear
	end
	def merge(new_name)
		Tribe.new({name: new_name, members: @tribes[0].members + @tribes[1].members})
	end
	def individual_immunity_challenge
		@tribes.last.members.sample
	end
end