class RemoveMoreColumnsfromProvider < ActiveRecord::Migration
  def change
    remove_column :providers, :uid, :integer
  end
end
