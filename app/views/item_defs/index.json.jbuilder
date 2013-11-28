json.array!(@item_defs) do |item_def|
  json.extract! item_def, :requirement_id, :request_type, :api_version, :batch, :transport_type, :notification, :encryption, :job_frequency
  json.url item_def_url(item_def, format: :json)
end
