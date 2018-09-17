class PostText < ApplicationRecord
  has_one :note
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end

  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :topics # post.topic_list が追加される

  mount_uploader :header_image, ImageUploader
  mount_uploader :image, ImageUploader


end

