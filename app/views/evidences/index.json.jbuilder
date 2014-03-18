json.array!(@evidences) do |evidence|
  json.extract! evidence, :id, :name, :description, :photo, :projectID, :location
  json.url evidence_url(evidence, format: :json)
end
