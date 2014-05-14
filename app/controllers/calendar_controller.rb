class CalendarController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_new_appointment_dropdowns, only: [:index]
  def index
    @staffs = User.where company_id: current_user.company_id

    # create a new blank appointment for adding new
    @appointment = Appointment.new
    @appointment.company_id = current_user.company_id
  end
end
