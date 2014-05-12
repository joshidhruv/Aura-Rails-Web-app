class Appointment < ActiveRecord::Base
  has_one :host, class_name: "User"
  has_one :guest, class_name: "User"
  has_one :service
  has_one :location
  has_one :company

  def timestart
    if !datetime_begin.nil?
      return datetime_begin.strftime("%H:%M")
    end
  end
end