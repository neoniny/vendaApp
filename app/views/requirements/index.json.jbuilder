json.array!(@requirements) do |requirement|
  json.extract! requirement, :client_name
  json.url requirement_url(requirement, format: :json)
end
