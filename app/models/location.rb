class Location < ActiveRecord::Base
  belongs_to :company
  has_many :location_hours
  accepts_nested_attributes_for :location_hours, :reject_if => :all_blank

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
end
