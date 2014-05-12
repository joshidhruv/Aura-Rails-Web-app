class Appointment < ActiveRecord::Base
  belongs_to :host, class_name: "User"
  validates :host_id, :presence => true

  belongs_to :guest, class_name: "User"
  validates :guest_id, :presence => true

  belongs_to :service
  validates :service_id, :presence => true

  belongs_to :location
  validates :location_id, :presence => true

  belongs_to :company
  validates :company_id, :presence => true

  validates :datetime_begin, :presence => true

  def timestart
    if !datetime_begin.nil?
      return datetime_begin.strftime("%H:%M")
    end
  end

  def datestart
    if !datetime_begin.nil?
      return datetime_begin.strftime("%m/%d/%Y")
    end
  end
end