json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :guest_id, :host_id, :location_id, :service_id, :cost, :datetime_begin, :datetime_end, :notification_on, :notification_sent, :accepted, :completed
  json.url appointment_url(appointment, format: :json)
end
