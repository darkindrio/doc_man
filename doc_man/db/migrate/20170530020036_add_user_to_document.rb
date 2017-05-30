class AddUserToDocument < ActiveRecord::Migration[5.0]
  def change
  	add_column :documents, :user, :reference, foreign_key: true
  end
end
