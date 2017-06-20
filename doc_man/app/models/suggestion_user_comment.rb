class SuggestionUserComment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
end
