class Note < ApplicationRecord
  belongs_to :user
  has_many :post_talks
  belongs_to :post_text
  belongs_to :post_image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :magazine_notes
  has_many :magazines, through: :magazine_notes
end
