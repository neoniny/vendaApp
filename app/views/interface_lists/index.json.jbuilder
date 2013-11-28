json.array!(@interface_lists) do |interface_list|
  json.extract! interface_list, :ref, :name, :interface_type, :definition
  json.url interface_list_url(interface_list, format: :json)
end
