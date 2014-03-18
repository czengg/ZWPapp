json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :zip
  json.url company_url(company, format: :json)
end
