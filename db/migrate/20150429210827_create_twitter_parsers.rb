class CreateTwitterParsers < ActiveRecord::Migration
  def change
    create_table :twitter_parsers do |t|

      t.timestamps null: false
    end
  end
end
