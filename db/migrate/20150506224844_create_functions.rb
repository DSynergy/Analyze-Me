class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :Dominant
      t.string :Auxiliary
      t.string :Tertiary
      t.string :Inferior
      t.integer :personality_id

      t.timestamps null: false
    end
  end
end
