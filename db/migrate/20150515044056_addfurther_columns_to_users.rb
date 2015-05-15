class AddfurtherColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :integer
  end
end
