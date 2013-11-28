json.array!(@interfaces) do |interface|
  json.extract! interface, :api_version, :api_ref, :api_name, :api_type, :ymlname
  json.url interface_url(interface, format: :json)
end
