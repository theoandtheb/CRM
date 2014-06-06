print "Enter a number: "
selectr = gets.chomp.to_i
unless selectr.between?(1,6)
	until selectr.between?(1,6)
	print "\nLet\'s try that again.\n\nEnter a number: "
	selectr = gets.chomp.to_i
	end
end



