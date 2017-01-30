class Customer
	include Comparable
	attr_accessor :name, :priority
	
	def initialize(name, priority)
		@name = name
		@priority = priority
	end

	def <=>(element)
		@priority <=> element.priority
	end

end

class PriorityQueue
	def initialize
		@elements = []
	end

	def <<(element)
		@elements << element
	end

	def pop
		@elements.sort!
		@elements.delete_at(0)
	end
end

def startScreen
	puts "Welcome to the seat organziner. What would you like to do?"
	puts "1. Add someone to the list"
	puts "2. Get the next to be seated"
	puts "3. Quit"
	puts ""
end

def optionOne
	puts "What is the customers name?"
	name = gets
	name.chomp
	puts "What is their priority?"
	p = gets
	p.chomp
	@q << Customer.new(name, p)
	system "clear"
end

def optionTwo
	system "clear"
	puts "The next to be seated is #{@q.pop.name}"
	puts "press ENTER key to continue"
	gets
	system "clear"
end

@q = PriorityQueue.new
startScreen
input = gets.to_i
while(input != 3)
system "clear"
if input == 1
	optionOne
	startScreen
elsif input == 2
	optionTwo
	startScreen
end
input = gets.to_i
end
system "clear"











