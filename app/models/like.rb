class Like < ApplicationRecord
  belongs_to :snkr
  belongs_to :user

  validates_uniqueness_of :snkr_id, scope: :user_id
end
