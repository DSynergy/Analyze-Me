class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.string :type
      t.string :image
      t.text :full_description
      t.text :short_description

      t.timestamps null: false
    end
  end
end
