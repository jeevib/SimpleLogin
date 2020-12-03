class EmailNotifierMailer < ApplicationMailer
	default from: "notifications@example.com"

	def customer_first_mail(customer)
		puts "**********#{customer}customer_first_mail***********"
		@customer = customer
	    @url  = 'http://localhost:3000'
	    mail(to: @customer.email, subject: 'Welcome to My Awesome Site')
	end

	def weekly_customer_report
		file_path = "#{Rails.root}/public/customer_report.csv" 
		attachments["customer_report"] = File.read(file_path)
		mail(to: "jeevi.sujee.23@gmail.com", sub: "Customer Report", body: "Weekly Customer Report Csv File")
		File.delete(file_path) if File.exist? (file_path)
	end
end
