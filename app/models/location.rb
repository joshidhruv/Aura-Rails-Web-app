class Location < ActiveRecord::Base
  belongs_to :company
  has_many :location_hours
  accepts_nested_attributes_for :location_hours, :reject_if => :all_blank
  has_many :appointments

  # format city, state for convenience
  def citystate
    @cs = ''

    if !self.city.nil?
      @cs += self.city
    end

    if @cs.length && !self.state.nil?
      @cs += ', '
    end

    if !self.state.nil?
      @cs += self.state
    end
    return @cs
  end

  def hoursOpen(day_of_week_id)
    @day_of_week = LocationHour::DAYS[day_of_week_id.to_i]
    @location_hours = self.location_hours.where day_of_week: @day_of_week

  end

  def timesAvailable
    self.location_hours.each do |day|

    end
  end
end
