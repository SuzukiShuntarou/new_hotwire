class NewReward < ApplicationRecord
  belongs_to :user
  has_many :goals, dependent: :destroy
end
