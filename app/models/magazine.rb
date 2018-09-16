class Magazine < ApplicationRecord
  has_many :magazine_notes
  has_many :notes, through: :magazine_notes
  validates :name, presence: true
end
