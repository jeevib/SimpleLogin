namespace :customer_report do
require 'csv'
  desc "mail customer report every friday"
  task customer_added: :environment do
  	CSV.open("public/customer_report.csv", 'w') do |csv|
  		csv << ["S.No", "Name", "Email"]
  		count = 0
  		Customer.where('created_at >= ? AND created_at <= ?', (Date.today - 7), (Date.today)).each do |customer|
  			count += 1
  			puts "***********#{customer.name}"
  			csv << [count, "#{customer.name}", "#{customer.email}"]
  		end
  	end
  	EmailNotifierMailer.weekly_customer_report.deliver_now
  end

end
