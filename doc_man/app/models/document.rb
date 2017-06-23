class Document < ApplicationRecord
  has_many :document_categories,  dependent: :destroy
  has_many :document_accesses,  dependent: :destroy
  has_many :categories, through: :document_categories,  dependent: :destroy
  has_many :users, through: :document_accesses,  dependent: :destroy
  has_many :suggestions,  dependent: :destroy
  has_many :likes,  dependent: :destroy 
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
