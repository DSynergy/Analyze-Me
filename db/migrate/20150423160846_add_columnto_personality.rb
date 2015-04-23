class AddColumntoPersonality < ActiveRecord::Migration
  def change
    add_column :personalities, :catchphrase, :string
  end
end
