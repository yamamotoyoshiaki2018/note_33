class Note < ApplicationRecord
  belongs_to :user
  has_many :post_talks
  has_many :post_texts
  has_many :post_images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tags, through: :tag_notes
  has_many :magazines, through: :magazine_notes
end
