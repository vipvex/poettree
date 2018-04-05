json.extract! poem, :id, :title, :body, :user_id, :image_url, :shared, :created_at, :updated_at
json.url poem_url(poem, format: :json)
