class Like < ApplicationRecord
  belongs_to :post_text, counter_cache: :likes_count
  belongs_to :post_image, counter_cache: :likes_count
  belongs_to :user

end
