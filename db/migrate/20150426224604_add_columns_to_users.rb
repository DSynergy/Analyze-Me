class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :location, :string
    add_column :users, :description, :string
    add_column :users, :status_count, :string
    add_column :users, :raw_data, :json
  end
end
