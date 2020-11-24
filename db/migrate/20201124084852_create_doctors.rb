class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :category
      t.string :hospital_name

      t.timestamps
    end
  end
end
