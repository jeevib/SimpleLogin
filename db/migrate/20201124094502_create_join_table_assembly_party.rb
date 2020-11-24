class CreateJoinTableAssemblyParty < ActiveRecord::Migration[6.0]
  def change
    create_join_table :assemblies, :parties do |t|
       t.index [:assembly_id, :party_id]
      # t.index [:party_id, :assembly_id]
    end
  end
end
