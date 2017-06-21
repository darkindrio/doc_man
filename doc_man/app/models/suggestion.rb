class Suggestion < ApplicationRecord
  belongs_to :document
  belongs_to :user
  has_many :suggestion_user_comments

  validates :text, {
  	length: { minimum: 1,  maximum: 500 },
  	presence: true
  	}

  def has_access(current_user)
  	collaborators = document.users
  	return collaborators.include? current_user
  end


end
