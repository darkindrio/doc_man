class Like < ApplicationRecord

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :document, class_name: 'Document', foreign_key: 'document_id'

  validates :user, presence: true
  validates :document, presence: true
  validates_uniqueness_of :document_id, :scope => :user_id

end
