class DropMbResults < ActiveRecord::Migration
  def change
    drop_table :mb_results
    drop_table :twitter_parsers
  end
end
