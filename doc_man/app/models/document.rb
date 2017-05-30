class Document < ApplicationRecord
  has_many :document_categories
  has_many :document_accesses
  has_many :categories, through: :document_categories
  has_many :users, through: :document_accesses
  validates :title, {
  	length: { minimum: 3,  maximum: 50 },
  	presence: true,
  	uniqueness: true
  	}
  validates :text, {
  	length: { minimum: 10 },
  	presence: true
  }
  accepts_nested_attributes_for :categories
  belongs_to :user
  def to_s
    return title
  end

end
