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

  # title, start, end = formatting for calendar feed
  def title
    if !service_id.nil? && !host_id.nil?
      return service.name + ' w/ ' + host.fullname
    end
  end
  def start
    if !datetime_begin.nil?
      return datetime_begin.strftime("%Y-%m-%d %H:%M:00")
    end
  end
  def end
    if !datetime_end.nil?
      return datetime_end.strftime("%Y-%m-%d %H:%M:00")
    end
  end
  def allDay
    if !datetime_end.nil?
      return false
    end
    return true
  end
  def color
    return host.color
  end
end