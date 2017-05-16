class DocumentCategory < ApplicationRecord
  belongs_to :document
  belongs_to :category
end
