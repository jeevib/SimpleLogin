class CustomersController < ApplicationController
	CUSTOMERS_PER_PAGE = 10

	def index
		@page = params.fetch(:page, 0).to_i
		@remaing_page = Customer.count - (@page * CUSTOMERS_PER_PAGE)
		@customers = Customer.offset(@page * CUSTOMERS_PER_PAGE).limit(CUSTOMERS_PER_PAGE)
	end

	def new
		@customer = Customer.new
	end

	def create
		@customer = Customer.new(name: params[:customer][:name], email: params[:customer][:email], password_digest: params[:customer][:password], mobile: params[:customer][:mobile], resume: params[:customer][:resume])
		if @customer.save
			EmailNotifierMailer.customer_first_mail(@customer).deliver_later
			# format.html { redirect_to(@customer, notice: 'Customer was successfully created.') }
		end
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

	def resume_delete
		@customer = Customer.find(params[:id])
		@customer.resume.purge if @customer.resume.attached?
		redirect_to customers_edit_path(@customer)
	end

	private
      def customer_params
        params.require(:customer).permit(:id, :name, :email, :password, :mobile, :resume)
      end
end
