class SuggestionUserComment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion

  def has_access(current_user)
  	return user == current_user
  end
end
