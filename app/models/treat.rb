class Treat < ApplicationRecord
  belongs_to :user
  has_many :completes, dependent: :destroy
end
