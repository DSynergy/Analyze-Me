class CreateUserProvider < ActiveRecord::Migration
  def change
    create_table :user_providers do |t|
      t.integer :user_id
      t.integer :provider_id
    end
  end
end
