class Location < ActiveRecord::Base
  belongs_to :company
  has_many :location_hours
  accepts_nested_attributes_for :location_hours, :reject_if => :all_blank
end
