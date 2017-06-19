class Suggestion < ApplicationRecord
  belongs_to :document
  belongs_to :user

  validates :text, {
  	length: { minimum: 1,  maximum: 500 },
  	presence: true
  	}

end
