class Cast < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project

  validates :position, presence: true

  enum position: %w[owner actor actress director producer writer editor camera lights set costume]
end
