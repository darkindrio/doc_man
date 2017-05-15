class Category < ApplicationRecord
	has_many :documents
	validates :title, {
		length: { minimum: 3,  maximum: 30 },
		presence: true,
		uniqueness: true
		}

	def to_s
    return title
  end
end
