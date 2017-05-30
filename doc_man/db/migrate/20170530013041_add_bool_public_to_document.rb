class AddBoolPublicToDocument < ActiveRecord::Migration[5.0]
  def change
  	add_column :documents, :is_public, :boolean
  	Document.all.each do |document|
  		document.update_attributes! :is_public => true
  	end
  end
end
