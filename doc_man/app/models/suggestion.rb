class Suggestion < ApplicationRecord
  belongs_to :document
  belongs_to :user

  validates :text, {
  	length: { minimum: 1,  maximum: 500 },
  	presence: true
  	}

  def has_access(current_user)
  	collaborators = document.users
  	if collaborators.include? current_user
  		return true
  	else
  		return false
    end
  end


end
