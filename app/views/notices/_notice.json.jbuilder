json.extract! notice, :id, :title, :content, :user_id, :created_at, :updated_at
json.url post_url(notice, format: :json)
