require 'colorizr'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
	puts divider
	puts "Phase One"
	puts divider
	8.times do 
		tribe_immunity_challenge
	end
end

def phase_two
	puts divider
	puts "Phase Two"
	puts divider
	@borneo.merge(@merge_tribe)
	3.times do
		single_immunity_challenge
	end

end

def phase_three
	puts divider
	puts "Phase Three"
	puts divider
	@merge_tribe.members do |member|
		jury_creation(member)
	end
	7.times do
		single_immunity_challenge
		@jury.add_member(@voted_off)
	end
	# @merge_tribe.members.each do |member|
	# 	@jury_members.delete(member)
	# end
	# @jury.add_member(@jury_members.first)
end

private

def divider
	("*" * 14) + "\n"
end


def tribe_immunity_challenge
	tribes = @borneo.tribes
	immune_tribe = @borneo.immunity_challenge
	elimination_tribe = tribes.find{|tribe| tribe.name != immune_tribe}
	@voted_off = elimination_tribe.tribal_council
	elimination_tribe.remove_member(@voted_off)
end

def single_immunity_challenge
	immune = @borneo.individual_immunity_challenge
	@voted_off = @merge_tribe.tribal_council(immune: immune)
	@merge_tribe.remove_member(@voted_off)
end

def jury_creation(members)
	@jury_members = []
	@jury_members << members
end



# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
