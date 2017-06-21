class CreateSuggestionUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestion_user_comments do |t|
      t.references :user, foreign_key: true, on_delete: :cascade
      t.references :suggestion, foreign_key: true, on_delete: :cascade
      t.text :comment

      t.timestamps
    end
  end
end
