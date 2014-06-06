class Rolodex
	def initialize
		@contactId = 1000
		@contacts = []
	end

	def contacts
		@contacts
	end

	def addContact(contact)
		contactId = @id
		@contacts << contact
		@id += 1
	end

end