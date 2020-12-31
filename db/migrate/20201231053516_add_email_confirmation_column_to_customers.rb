class AddEmailConfirmationColumnToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :email_confirmation, :boolean, :default => false
    add_column :customers, :confirm_token_status, :string
  end
end
