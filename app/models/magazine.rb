class Magazine < ApplicationRecord
  has_many :magazine_notes
  has_many :notes, through: :magazine_notes
  validates :magazine_title, presence: true

  mount_uploader :magazine_header_image, ImageUploader
end
