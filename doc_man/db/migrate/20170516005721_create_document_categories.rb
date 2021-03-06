class CreateDocumentCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :document_categories do |t|
      t.references :document, foreign_key: true, on_delete: :cascade
      t.references :category, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
