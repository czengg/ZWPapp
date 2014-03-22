json.array!(@paragraph_assignments) do |paragraph_assignment|
  json.extract! paragraph_assignment, :id, :paragraph_id, :report_id, :rating
  json.url paragraph_assignment_url(paragraph_assignment, format: :json)
end
