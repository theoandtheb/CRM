require_relative 'contact'
require_relative 'rolodex'

class CRM
	attr_accessor :name
		def initialize(name)
			@name = name
			@rolodex = Rolodex.new
			puts "Welcome to #{name}"
		end

		def self.run(name)
			crm = new(name)
			crm.mainMenu
			crm.selectOption
		end


	def mainMenu
		print "
		Main Menu:
		\n[1] Add new contact
		\n[2] Modify an existing contact
		\n[3] Delete a contacts
		\n[4] Display all the contacts
		\n[5] Display a contact's attrinutes
		\n[6] Exit\n\n"
	end

	def selectOption
		print "Enter a number: "
		selectr = gets.chomp.to_i
		unless selectr.between?(1,6)
			until selectr.between?(1,6)
			print "\nLet\'s try that again.\n\nEnter a number: "
			selectr = gets.chomp.to_i
			end
		end
		call_option(selectr)
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

	def addNewContact
 		 print "Enter First Name: "
 		 first_name = gets.chomp
 		 print "\n\nEnter Last Name: "
 		 last_name = gets.chomp
 		 print "\n\nEnter Email Address: "
 		 email = gets.chomp
 		 	unless email.include? "@"
 		 		print "\n\nEnter Valid Email Address: "
 			 	email = gets.chomp
		 	end
 		 print "\n\nEnter a Note: "
 		 note = gets.chomp
 		 contact = Contact.new(first_name, last_name, email, note)
 		 mainMenu
 		 selectOption
	end
end

CRM.run("G.U.S.S.")