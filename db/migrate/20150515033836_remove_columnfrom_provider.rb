class RemoveColumnfromProvider < ActiveRecord::Migration
  def change
    remove_column :providers, :user_id, :integer
  end
end
