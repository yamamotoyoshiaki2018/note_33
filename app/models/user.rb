class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_texts
  has_many :comments

  has_many :follows
  has_many :followings, through: :follows, source: :followed
  has_many :reverses_of_follow, class_name: "Follow", foreign_key: "followed_id"
  has_many :followers, through: :reverses_of_follow, source: :user

  mount_uploader :header_image, ImageUploader
  mount_uploader :avatar_image, ImageUploader

# ユーザーをフォローする
  def follow(other_user)
    unless self == other_user
      self.follows.find_or_create_by(followed_id: other_user.id)
    end
  end

  # ユーザーをアンフォローする
  def unfollow(other_user)
    follow = self.follows.find_by(followed_id: other_user.id)
    follow.destroy if follow
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    self.followings.include?(other_user)
  end

end
