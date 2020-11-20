class CustomersController < ApplicationController

	def index
		@customers = Customer.all
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.create(name: params[:customer][:name], email: params[:customer][:email], password_digest: params[:customer][:password], mobile: params[:customer][:mobile])
		redirect_to home_path
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:customer][:id])
		if @customer
			@customer.update(name: params[:customer][:name], email: params[:customer][:email], password_digest: params[:customer][:password], mobile: params[:customer][:mobile])
		end
		redirect_to customers_index_path
	end

	def destroy
		@customer = Customer.find(params[:id])
		if @customer
			@customer.delete
		end
		redirect_to customers_index_path
	end

	private
      def customer_params
        params.require(:customer).permit(:id, :name, :email, :password, :mobile)
      end
end
