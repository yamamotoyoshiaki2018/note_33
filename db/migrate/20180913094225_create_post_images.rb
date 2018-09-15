class CreatePostImages < ActiveRecord::Migration[5.0]
  def change
    create_table :post_images do |t|
      t.string :title,    null: false
      t.text :image_description
      t.string :image

      t.timestamps
    end
  end
end
