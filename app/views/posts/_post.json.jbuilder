json.extract! post, :id, :title, :content, :created_at, :description, :reputation, :author, :created_at, :updated_at
json.url post_url(post, format: :json)
