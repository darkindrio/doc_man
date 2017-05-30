class CreateDocumentAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :document_accesses do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true
      t.timestamps
    end
  end
end
