class AddPostImageIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :post_image_id, :integer
  end
end
