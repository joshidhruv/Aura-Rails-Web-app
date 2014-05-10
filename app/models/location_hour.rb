class LocationHour < ActiveRecord::Base
  belongs_to :location
  attr_accessor :id, :day_of_week, :open, :close, :closed, :location_id

  def self.business_hours
    hours = Array.new

    hours << "12:00am"
    hours << "12:30am"

    (1..11).each do |i|
      hours << i.to_s + ":00am"
      hours << i.to_s + ":30am"
    end

    hours << "12:00pm"
    hours << "12:30pm"

    (1..11).each do |i|
      hours << i.to_s + ":00pm"
      hours << i.to_s + ":30pm"
    end
    return hours
  end
end
