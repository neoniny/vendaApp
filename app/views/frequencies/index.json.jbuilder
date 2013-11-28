json.array!(@frequencies) do |frequency|
  json.extract! frequency, :api_ref, :tier3, :tier2, :tier1
  json.url frequency_url(frequency, format: :json)
end
