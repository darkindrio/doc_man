class Category < ApplicationRecord
	has_many :document_categories
	has_many :documents, through: :document_categories
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
