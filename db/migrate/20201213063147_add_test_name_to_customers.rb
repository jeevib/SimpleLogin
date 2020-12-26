class AddTestNameToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :test_name, :string
  end
end
