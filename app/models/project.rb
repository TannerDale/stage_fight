class Project < ApplicationRecord
  validates :title, presence: true
  validates :summary, presence: true

  has_many :casts, dependent: :destroy
  has_many :users, through: :casts

  scope :with_open_positions, -> {
  }
end
