class AddUserIdToPostTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :post_texts, :user_id, :integer
  end
end
