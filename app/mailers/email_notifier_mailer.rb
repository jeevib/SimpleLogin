class EmailNotifierMailer < ApplicationMailer
	default from: "notifications@example.com"

	def customer_first_mail(customer)
		puts "**********#{customer}customer_first_mail***********"
		@customer = customer
	    @url  = 'http://localhost:3000'
	    mail(to: @customer.email, subject: 'Welcome to My Awesome Site')
	end
end
