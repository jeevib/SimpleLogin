class AddSecoundNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :secound_name, :string
    add_column :users, :string, :string
  end
end
