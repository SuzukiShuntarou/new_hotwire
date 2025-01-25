class Treat < ApplicationRecord
  belongs_to :user

  has_many :marks, dependent: :destroy
  accepts_nested_attributes_for :marks, allow_destroy: true
end
