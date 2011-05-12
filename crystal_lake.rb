require File.join(File.dirname(__FILE__), 'avatar')
require File.join(File.dirname(__FILE__), 'room')
require File.join(File.dirname(__FILE__), 'input_controller')

lake = Room.new
lake.description = "You are standing by a beautiful lake."

forest = Room.new
forest.description = "You are in a forest, surrounded by lush trees."

house = Room.new
house.description = "You're by your house! Home, sweet home."

lake.rooms = {:north => forest}
forest.rooms = {:south => lake, :west => house}
house.rooms = {:east => forest}

a = Avatar.new(lake)
ctl = InputController.new
ctl.avatar = a

def repl(ctl)
	puts ctl.current_message
	puts 
	print "> "
	input = gets.chomp.to_sym
	ctl.evaluate(input)
	repl(ctl)
end

repl(ctl)
	
