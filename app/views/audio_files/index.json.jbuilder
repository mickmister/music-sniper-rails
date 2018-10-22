json.array! @audio_files do |file|
  json.(file, :id, :url)
end
