class PostImage < ApplicationRecord
  has_one :note
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
end
