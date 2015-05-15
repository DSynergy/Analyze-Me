class Provider < ActiveRecord::Base
  has_many :users, through: :user_providers
  has_many :user_providers   
end
