class PostText < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :header_image, ImageUploader
  mount_uploader :image, ImageUploader


end


