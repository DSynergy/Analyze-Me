class AddColumnToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :uid, :string
  end
end
