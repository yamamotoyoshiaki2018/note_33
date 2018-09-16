class AddPostImageIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :notes, :post_image, index: true
  end
end
