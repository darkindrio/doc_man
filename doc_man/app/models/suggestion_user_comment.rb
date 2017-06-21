class SuggestionUserComment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion

  def has_access(current_user)
  	if user == current_user
  		return true
  	else
  		return false
    end
  end
end
