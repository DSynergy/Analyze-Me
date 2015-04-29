class CreateMbResults < ActiveRecord::Migration
  def change
    create_table :mb_results do |t|

      t.timestamps null: false
    end
  end
end
