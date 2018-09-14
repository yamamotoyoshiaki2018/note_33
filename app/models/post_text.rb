class PostText < ApplicationRecord
  belongs_to :note
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  acts_as_taggable_on :topics # post.topic_list が追加される

  mount_uploader :header_image, ImageUploader
  mount_uploader :image, ImageUploader


end


