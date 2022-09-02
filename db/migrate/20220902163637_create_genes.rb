class CreateGenes < ActiveRecord::Migration[7.0]
  def change
    create_table :genes do |t|
      t.string :ens_id
      t.string :common_name
      t.string :cds_sequence
      t.integer :user_id

      t.timestamps
    end
  end
end
