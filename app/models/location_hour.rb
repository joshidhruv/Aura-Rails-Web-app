class LocationHour < ActiveRecord::Base
  belongs_to :location
  attr_accessor :day_of_week, :open, :close, :location_id
end
