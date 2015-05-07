class Personality < ActiveRecord::Base
  belongs_to :user
  has_one :function
end
