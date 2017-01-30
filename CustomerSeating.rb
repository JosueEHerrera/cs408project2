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
		@elements.push(element)
	end

	def pop
		@elements.sort!
		@elements.delete_at(0)
	end
end

def startScreen
	puts "Welcome to the seat orginizer. What would you like to do?"
	puts "1. Add someone to the list"
	puts "2. Get the next to be seated"
	puts "3. Quit"
end

def optionOne
	puts "What is the customers name?"
	name = gets
	name.chomp
	puts "What is their priority?"
	p = gets
	p.chomp
	@q << Customer.new(name, p)
end

def optionTwo
	puts "The next to be seated is #{@q.pop.name}"
end

@q = PriorityQueue.new
startScreen
input = gets.to_i
while(input != 3)
if input == 1
	optionOne
	startScreen
elsif input == 2
	optionTwo
	startScreen
end
input = gets.to_i
end











