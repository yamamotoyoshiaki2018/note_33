class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.references :user
      t.references :post_text
      t.integer :publish_status
      t.timestamps
    end
  end
end

