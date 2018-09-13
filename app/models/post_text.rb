class PostText < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  mount_uploader :header_image, ImageUploader
  mount_uploader :image, ImageUploader


end

