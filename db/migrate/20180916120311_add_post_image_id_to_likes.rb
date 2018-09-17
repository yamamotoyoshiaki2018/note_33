class AddPostImageIdToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :post_image_id, :integer
  end
end
