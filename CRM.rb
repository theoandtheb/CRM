print "Enter a number: "
selectr = gets.chomp.to_i
unless selectr.between?(1,6)
	until selectr.between?(1,6)
	print "\nLet\'s try that again.\n\nEnter a number: "
	selectr = gets.chomp.to_i
	end
end

def call_option(selectr)
	case selectr
	when 1
		addNewContact
	when 2
		modifyContact
	when 3
		deleteContact
	when 4
		displayContact
	when 5
		displayAttribute
	when 6
		return
	end
end

