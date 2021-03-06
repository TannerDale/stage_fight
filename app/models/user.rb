class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create

  has_many :casts, dependent: :destroy
  has_many :projects, through: :casts
end
