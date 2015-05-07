class AddMoreColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :introversion,       :decimal, precision: 5, scale: 2
    add_column :users, :extraversion,       :decimal, precision: 5, scale: 2
    add_column :users, :intuition,          :decimal, precision: 5, scale: 2
    add_column :users, :sensing,            :decimal, precision: 5, scale: 2
    add_column :users, :thinking,           :decimal, precision: 5, scale: 2
    add_column :users, :feeling,            :decimal, precision: 5, scale: 2
    add_column :users, :judging,            :decimal, precision: 5, scale: 2
    add_column :users, :perceiving,         :decimal, precision: 5, scale: 2

    add_column :users, :negative_sentiment, :decimal, precision: 5, scale: 2
    add_column :users, :postive_sentiment,  :decimal, precision: 5, scale: 2

    add_column :users, :topic_arts,         :decimal, precision: 5, scale: 2
    add_column :users, :topic_business,     :decimal, precision: 5, scale: 2
    add_column :users, :topic_computers,    :decimal, precision: 5, scale: 2
    add_column :users, :topic_games,        :decimal, precision: 5, scale: 2
    add_column :users, :topic_health,       :decimal, precision: 5, scale: 2
    add_column :users, :topic_home,         :decimal, precision: 5, scale: 2
    add_column :users, :topic_recreation,   :decimal, precision: 5, scale: 2
    add_column :users, :topic_science,      :decimal, precision: 5, scale: 2
    add_column :users, :topic_society,      :decimal, precision: 5, scale: 2
    add_column :users, :topic_sports,       :decimal, precision: 5, scale: 2

    add_column :users, :age_group1,         :decimal, precision: 5, scale: 2
    add_column :users, :age_group2,         :decimal, precision: 5, scale: 2
    add_column :users, :age_group3,         :decimal, precision: 5, scale: 2
    add_column :users, :age_group4,         :decimal, precision: 5, scale: 2
    add_column :users, :age_group5,         :decimal, precision: 5, scale: 2
    add_column :users, :age_group6,         :decimal, precision: 5, scale: 2

    add_column :users, :personality_id, :integer
    add_index :users, :personality_id
  end
end
