class Document < ApplicationRecord
  belongs_to :category
  validates :title, {
  	length: { minimum: 3,  maximum: 50 },
  	presence: true,
  	uniqueness: true
  	}
  validates :text, {
  	length: { minimum: 10 },
  	presence: true
  }

  def to_s
    return title
  end
end
