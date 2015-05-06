class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introversion,       :float
    add_column :users, :extraversion,       :float
    add_column :users, :intuition,          :float
    add_column :users, :sensing,            :float
    add_column :users, :thinking,           :float
    add_column :users, :feeling,            :float
    add_column :users, :judging,            :float
    add_column :users, :perceiving,         :float

    add_column :users, :negative_sentiment, :float
    add_column :users, :postive_sentiment,  :float

    add_column :users, :topic_arts,         :float
    add_column :users, :topic_business,     :float
    add_column :users, :topic_computers,    :float
    add_column :users, :topic_games,        :float
    add_column :users, :topic_health,       :float
    add_column :users, :topic_home,         :float
    add_column :users, :topic_recreation,   :float
    add_column :users, :topic_science,      :float
    add_column :users, :topic_society,      :float
    add_column :users, :topic_sports,       :float

    add_column :users, :age_group1,         :float
    add_column :users, :age_group2,         :float
    add_column :users, :age_group3,         :float
    add_column :users, :age_group4,         :float
    add_column :users, :age_group5,         :float
    add_column :users, :age_group6,         :float

    add_column :users, :personalities_id, :integer
    add_index :users, :personalities_id
  end
end
