

class Jury
	attr_accessor :members
	
	def initialize
		@members = []
	end

	def add_member(jury_members)
		@members << jury_members
	end

	def cast_votes(finalists)
		finalist_votes = {finalists[0] => 0, finalists[1] => 0}
		@members.each do |member|
			choice = finalists.sample
			puts "#{member} voted for #{choice}!"
			finalist_votes[choice] += 1
		end
		finalist_votes
	end

	def report_votes(final_votes)
		final_votes.each do |finalist, count|
			puts "#{finalist} recieved #{count} votes!"
		end
	end

	def announce_winner(final_votes)
		winner = final_votes.sort_by {|finalist, vote_count| vote_count}.last
		puts "#{winner} is the winner!".red
		winner[0]
	end
end