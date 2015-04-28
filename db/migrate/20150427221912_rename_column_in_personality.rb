class RenameColumnInPersonality < ActiveRecord::Migration
  def change
    rename_column :personalities, :type, :MBPT
  end
end
