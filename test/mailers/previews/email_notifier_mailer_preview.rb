# Preview all emails at http://localhost:3000/rails/mailers/email_notifier_mailer/customer_first_mail
class EmailNotifierMailerPreview < ActionMailer::Preview

	def customer_first_mail
		#Preview this email at http://localhost:3000/rails/mailers/email_notifier_mailer/customer_first_mail
		@customer = Customer.last
	    EmailNotifierMailer.customer_first_mail(@customer).deliver_later
	end
end
