class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :token
      t.string :uid
      t.string :email
      t.string :first_name
      t.string :image
      t.string :last_name
      t.string :name

      t.timestamps null: false
    end
  end
end
