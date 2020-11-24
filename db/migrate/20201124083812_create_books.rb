class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :category
      t.string :part

      t.timestamps
    end
  end
end
