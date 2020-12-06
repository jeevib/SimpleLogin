class WebhookController < ApplicationController
	skip_before_action :verify_authenticity_token

	def fetch_customer_details
		@customer = Customer.find_by_name(params[:name]) if params[:name].present?
	    render json: @customer
	end
end
