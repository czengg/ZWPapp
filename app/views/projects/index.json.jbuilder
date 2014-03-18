json.array!(@projects) do |project|
  json.extract! project, :id, :name, :companyID
  json.url project_url(project, format: :json)
end
