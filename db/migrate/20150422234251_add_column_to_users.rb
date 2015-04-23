class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :locale, :string
    add_column :users, :link, :string
    add_column :users, :gender, :string
  end
end
