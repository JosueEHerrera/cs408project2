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
	
	attr_reader :elements

	def initialize
		@elements = []
	end

	def <<(element)
		@elements << element
		@elements.sort!
	end

	def pop
		@elements.delete_at(0)
	end
	
	def get
		#@elements.sort!
		counter = 1
		waitTime = 5
		@elements.each do|x| 
			puts "#{counter}: #{x.name.chomp} wait time: #{waitTime*counter}"
			counter += 1
		end 
	end 
end

def startScreen
	puts "Welcome to the seat organizer. What would you like to do?"
	puts "1. Add someone to the list"
	puts "2. Get the next to be seated"
	puts "3. Show full list"
	puts "4. Quit"
	puts ""
end

def optionOne
	puts "What is the customers name?"
	name = gets
	name.chomp
	puts "What is their priority (VIP,Important,Regular,Nobody)"
	p = gets.chomp
	puts p
	case p
		when "VIP"
			p = 1
		when "Important"
			p = 2
		when "Regular"
			p = 3
		when "Nobody"
			p = 4
		else
			puts "Please enter a priority name"
			optionOne
		end
	@q << Customer.new(name, p)
	system "clear"
end

def optionTwo
	system "clear"
	if @q.elements.empty?
		puts "Nobody to be seated"
		puts "Press ENTER to continue"
		gets
		system "clear"
	else
	puts "The next to be seated is #{@q.pop.name}"
	puts "press ENTER key to continue"
	gets
	system "clear"
	end
end
def optionThree
	system "clear"
	puts "Currently Waiting: "
	@q.get
	puts "press ENTER key to continue"
	gets
	system "clear"

end 



@q = PriorityQueue.new
startScreen
input = gets.to_i
while(input != 4)
system "clear"
if input == 1
	optionOne
	startScreen
elsif input == 2
	optionTwo
	startScreen
elsif input == 3
	optionThree
	startScreen
elsif input > 4 or input < 1
	puts "Please only use options 1, 2, 3, or 4"
	puts ""
	startScreen
end
input = gets.to_i
end
system "clear"











