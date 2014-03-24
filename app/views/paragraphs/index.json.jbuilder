json.array!(@paragraphs) do |paragraph|
  json.extract! paragraph, :id, :section_name, :body_text, :active
  json.url paragraph_url(paragraph, format: :json)
end
