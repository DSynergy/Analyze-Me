class AddColumnToPersonality < ActiveRecord::Migration
  def change
    add_column :personalities, :extraversion, :string
    add_column :personalities, :introversion, :string
    add_column :personalities, :intuition, :string
    add_column :personalities, :sensing, :string
    add_column :personalities, :user_id, :integer
    add_index :personalities, :user_id
  end
end
