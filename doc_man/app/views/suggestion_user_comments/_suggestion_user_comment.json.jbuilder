json.extract! suggestion_user_comment, :id, :user_id, :suggestion_id, :comment, :created_at, :updated_at
json.url suggestion_user_comment_url(suggestion_user_comment, format: :json)
