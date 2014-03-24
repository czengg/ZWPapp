json.array!(@reports) do |report|
  json.extract! report, :id, :name, :project_id, :active
  json.url report_url(report, format: :json)
end
