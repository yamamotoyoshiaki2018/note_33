class CreatePostTexts < ActiveRecord::Migration[5.0]
  def change
    create_table :post_texts do |t|
      t.string :header_image
      t.string :title,    null: false
      t.text :text
      t.string :image
      t.timestamps
    end
  end
end






