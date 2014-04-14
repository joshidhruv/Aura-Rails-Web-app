json.array!(@addons) do |addon|
  json.extract! addon, :id, :name, :price, :description, :company_id
  json.url addon_url(addon, format: :json)
end
