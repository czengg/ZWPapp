json.array!(@category_assignments) do |category_assignment|
  json.extract! category_assignment, :id, :tagID, :categoryID
  json.url category_assignment_url(category_assignment, format: :json)
end
