json.array!(@user_services) do |user_service|
  json.extract! user_service, :id
  json.url user_service_url(user_service, format: :json)
end
