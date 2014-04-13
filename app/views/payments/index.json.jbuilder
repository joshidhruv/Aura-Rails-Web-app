json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :appointment_id
  json.url payment_url(payment, format: :json)
end
