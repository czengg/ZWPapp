json.array!(@tag_assignments) do |tag_assignment|
  json.extract! tag_assignment, :id, :evidenceID, :tagID, :rating
  json.url tag_assignment_url(tag_assignment, format: :json)
end
