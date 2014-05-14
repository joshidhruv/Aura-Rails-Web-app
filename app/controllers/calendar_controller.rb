class CalendarController < ApplicationController
  before_filter :authenticate_user!
  def index
    @staffs = User.where company_id: current_user.company_id
  end
end
