require_relative 'contact'
require_relative 'rolodex'

def intCheck(x,y)
		$selectr = gets.chomp.to_i
		unless $selectr.between?(x,y)
			until $selectr.between?(x,y)
			print "\nLet\'s try that again.\n\nEnter a number: "
			$selectr = gets.chomp.to_i
			end
		end
end


class CRM
	attr_accessor :name
		def initialize(name)
			@name = name
			@rolodex = Rolodex.new
			puts "Welcome to #{name}"
		end

		def self.run(name)
			crm = CRM.new(name)
			crm.mainMenu
			crm.selectOption
		end


	def mainMenu
		print "
		Main Menu:
		\n[1] Add new contact
		\n[2] Modify an existing contact
		\n[3] Delete a contact
		\n[4] Display all the contacts
		\n[5] Display a contact's attributes
		\n[6] Exit\n\n"
	end

	def selectOption
		print "Enter a number: "
		intCheck(1,6)
		selectr = $selectr
		call_option(selectr)
	end

	def call_option(selectr)
		case $selectr
		when 1
			addNewContact
		when 2
			modifyContact
		when 3
			deleteContact
		when 4
			displayContacts
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
 		 		print "\n\nPlease Enter Valid Email Address: "
 			 	email = gets.chomp
		 	end
 		 print "\n\nEnter a Note: "
 		 note = gets.chomp
 		contact = Contact.new(first_name, last_name, email, note)
 		@rolodex.addContact(contact)
 		 mainMenu
 		 selectOption
	end

	def findUser
	 	print "\nPlease specify the contact ID of the contact you wish to modify: " 
 		modId = gets.chomp.to_i
		unless modId >= 1000
			until modId >= 1000
				 "\nLet\'s try that again.\n\nEnter the contact ID of the contact you wish to modify: : "
				modId = gets.chomp.to_i
			end
		end
  		modId
  	end

  	def modifyContact
  		modId = findUser
  		@rolodex.modify(modId)
  		mainMenu
  		selectOption
  	end

  	def deleteContact
  		modId = findUser
  		@rolodex.delete(modId)
  		mainMenu
  		selectOption
  	end

  	def displayContacts
  		@rolodex.displayContacts
  		mainMenu
  		selectOption
  	end

  	def displayAttribute
  		@rolodex.displayAttribute
  		mainMenu
  		selectOption
  	end
end

CRM.run("G.U.S.S.")