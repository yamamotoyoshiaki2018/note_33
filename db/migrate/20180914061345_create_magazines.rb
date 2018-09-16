class CreateMagazines < ActiveRecord::Migration[5.0]
  def change
    create_table :magazines do |t|
      t.string :magazine_title
      t.text :magazine_description
      t.string :magazine_header_image
      t.integer :magazine_author_id
      t.integer :magazine_publish_status
      t.timestamps
    end
  end
end
