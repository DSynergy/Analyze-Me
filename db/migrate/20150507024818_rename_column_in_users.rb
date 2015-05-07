class RenameColumnInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :postive_sentiment, :positive_sentiment
  end
end
