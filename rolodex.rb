class Rolodex
	attr_accessor :contacts
	def initialize
		@id = 1000
		@contacts = Array.new
	end

	def contacts
		@contacts
	end

	def addContact(contact)
		contact.id = @id
		@contacts << contact
		@id += 1
	end

	def modify(modId)
	
		print "
		\nPlease select which attribute do you wish to change.
		Enter the corresponding number and press enter.\n
		[1] First Name
		[2] Last Name
		[3] Email
		[4] Notes
		\n\n =>  "
		attrSel = gets.chomp.to_i
		unless attrSel.between?(1,4)
			until attrSel.between?(1,4)
				print "\nLet\'s try that again.\n\nEnter a number: "
				attrSel = gets.chomp.to_i
			end
		end
		print "\nWhat would you like to change it to?  "
		repl = gets.chomp
		@contacts.each do |contact|
			if contact.id == modId
				case attrSel
					when 1
						print "\nAre you sure you would like me to replace \"#{contact.first_name}\" with \"#{repl}\"? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.first_name = repl
							print "Your change has been saved successfully."
						end
					when 2
						print "\nAre you sure you would like me to replace \"#{contact.last_name}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.last_name = repl
							print "Your change has been saved successfully."
						end
					when 3
						print "\nAre you sure you would like me to replace \"#{contact.email}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.email = repl
							print "Your change has been saved successfully."
						end
					when 4
						print "\nAre you sure you would like me to replace \"#{contact.note}\" with \"#{repl}? y/n  "
						modAnswer = gets.chomp
						if modAnswer == ("y")
							contact.note = repl
							print "Your change has been saved successfully."
						end
				end
			else 
						print "\nI'm sorry, but there is no contact with that ID.  Please try again."
			end
		end
	end

	def delete(modId)
		@contacts.each do |contact|
			if contact.id == modId
				print "\nAre you sure you would like to delete the profile for #{contact.first_name} #{contact.last_name}?  y/n"
				delAnswer = gets.chomp
				if delAnswer == ("y" || "yes")
					@contacts.delete(contact)
					print "\nThe selected contact has been successfully deleted."
				end 
			else
				print "\nI'm sorry, but I was not able to locate the contact you requested."
			end
		end
	end

	def displayContacts
		print "\nYour contacts\n\n"
		@contacts.each do |contact|
			print "____________________________________________________________
			#{contact.first_name} #{contact.last_name} can be reached at #{contact.email}.\n
			Don't forget, #{contact.note}\n"
		end
	end

	def displayAttribute
		print "\nWhich of these attributes would you like me to display?
		____________________________________________________________\n
		[1] First Name
		[2] Last Name
		[3] Email
		[4] Notes
		\n\n =>  "
		attrSel = gets.chomp.to_i
		unless attrSel.between?(1,4)
			until attrSel.between?(1,4)
				print "\nLet\'s try that again.\n\nEnter a number: "
				attrSel = gets.chomp.to_i
			end
		end
		@contacts.each do |contact|
			case attrSel
				when 1
					print "\nFirst Name: #{contact.first_name}"
				when 2
					print "\nLast Name: #{contact.last_name}"
				when 3
					print "\nEmail: #{contact.email}"
				when 4
					print "\nNote: #{contact.note}"
			end
		end
	end
end




