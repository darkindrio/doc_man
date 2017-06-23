class Category < ApplicationRecord
	has_many :document_categories,  dependent: :destroy
	has_many :documents, through: :document_categories,  dependent: :destroy 
	validates :title, {
		length: { minimum: 3,  maximum: 30 },
		presence: true,
		uniqueness: true
		}

	accepts_nested_attributes_for :documents

	def to_s
    return title
  end
end
