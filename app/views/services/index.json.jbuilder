json.array!(@services) do |service|
  json.extract! service, :id, :name, :description, :price, :minutes_duration, :company_id, :all_staff
  json.url service_url(service, format: :json)
end
