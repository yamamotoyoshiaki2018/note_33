class CreateMagazineNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :magazine_notes do |t|
      t.references :magazine, foreign_key: true
      t.references :note, foreign_key: true
      t.timestamps
    end
  end
end
