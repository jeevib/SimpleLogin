class CustomersController < ApplicationController

	def create
		binding.pry
		@customer = Customer.create(name: params[:name], email: params[:email], password_digest: params[:password], mobile: params[:mobile])
		if @customer.save
			render json: {
		        status: :created,
		        customer: @customer
		    }
		end
	end

	private
      def customer_params
        params.require(:customer).permit(:id, :name, :email, :password, :mobile)
      end
end
