json.extract! feedback, :id, :category,, :url,, :email,, :phone,, :country,, :comment, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
