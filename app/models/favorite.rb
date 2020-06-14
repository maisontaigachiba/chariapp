class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates_uniqueness_of :bike_id, scope: :user_id
end
