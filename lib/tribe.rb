require 'colorizr'

class Tribe
	attr_accessor :name, :members

	def initialize(options = {})
		@name = options[:name]
		@members = options[:members]
		print_tribe
	end
	def print_tribe
		puts "Tribe #{@name} has the following members:".blue
		@members.each do |member|
			puts "#{member}"
		end
	end
	def to_s
		@name
	end
	def tribal_council(immune = {})
		voted_off = @members.reject { |member| member == immune[:immune]}.sample
	end
	def remove_member(member)
		@members.delete(member)
	end
end