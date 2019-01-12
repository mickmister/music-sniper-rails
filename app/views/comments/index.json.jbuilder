json.array! @comments do |comment|
  json.(comment, :id, :user_id, :audio_file_id, :text, :created_at, :updated_at)
end
