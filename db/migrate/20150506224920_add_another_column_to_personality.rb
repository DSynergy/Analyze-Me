class AddAnotherColumnToPersonality < ActiveRecord::Migration
  def change
    add_column :personalities, :famous_people, :string
  end
end
