class CreateAssemblies < ActiveRecord::Migration[6.0]
  def change
    create_table :assemblies do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
