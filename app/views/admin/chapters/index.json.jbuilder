json.array!(@admin_chapters) do |admin_chapter|
  json.extract! admin_chapter, :title, :status, :sort
  json.url admin_chapter_url(admin_chapter, format: :json)
end
