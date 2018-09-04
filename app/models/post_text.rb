class PostText < ApplicationRecord
  belongs_to :note

  mount_uploader :header_image, ImageUploader
end
