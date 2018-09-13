class AddLikesCountToPostTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :post_texts, :likes_count, :integer
  end
end
