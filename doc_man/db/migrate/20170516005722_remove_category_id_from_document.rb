class RemoveCategoryIdFromDocument < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :category_id, :int
  end
end
