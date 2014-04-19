class Appointment < ActiveRecord::Base
  has_one :host, class_name: "User"
  has_one :guest, class_name: "User"
  has_one :service
  has_one :location

end
