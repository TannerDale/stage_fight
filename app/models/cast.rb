class Cast < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project

  validates :position, presence: true
end
