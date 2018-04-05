json.extract! lesson_completed, :id, :lesson_id, :user_id, :created_at, :updated_at
json.url lesson_completed_url(lesson_completed, format: :json)
