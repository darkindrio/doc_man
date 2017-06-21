class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.references :document, foreign_key: true, on_delete: :cascade
      t.references :user, foreign_key: true, on_delete: :cascade
      t.text :text
      t.string :status

      t.timestamps
    end
  end
end
