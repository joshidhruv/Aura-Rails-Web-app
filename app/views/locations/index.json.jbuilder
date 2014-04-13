json.array!(@locations) do |location|
  json.extract! location, :id, :company_id, :name, :address1, :address2, :city, :state, :zip, :phone, :email, :primary
  json.url location_url(location, format: :json)
end
