class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_text
  belongs_to :post_image
end
