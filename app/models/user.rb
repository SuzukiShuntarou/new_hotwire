class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :rewards, dependent: :destroy
  has_many :goals, dependent: :destroy

  has_many :treats, dependent: :destroy
  has_many :marks, dependent: :destroy
end
