class PostImage < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
end
