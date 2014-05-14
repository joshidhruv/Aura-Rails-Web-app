class ApplicationController < ActionController::Base
  require 'active_support/all'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:id, :email, :password, :password_confirmation, :company_attributes => [ :name ], :roles_attributes => [ :id ] ) }
  end

  def set_new_appointment_dropdowns
    # get all locations for this company
    # used for dropdowns on appt form
    @locations = {}
    if !current_user.company.locations.nil?
      current_user.company.locations.each do |location|
        @locations[location.citystate] = location.id
      end
    end

    # past clients who are registered in the system
    @guests = {}
    if !current_user.company.appointments.nil?
      current_user.company.appointments.select(:guest_id).distinct.each do |appt|
        if !appt.guest_id.nil?
          display_name = appt.guest.fullname
          if !appt.guest.email.nil?
            display_name += " ("+appt.guest.email+")"
          end
          @guests[display_name] = appt.guest.id
        end

      end
    end

    @newGuest = User.new
    @newGuest.role_id = Role::ROLE_REGISTERED
    # current staff list
    @staff = {}
    if !current_user.company.users.nil?
      current_user.company.users.each do |user|
        @staff[user.fullname] = user.id
      end
    end

    # current staff list
    @services = {}
    if !current_user.company.services.nil?
      @services = current_user.company.services
    end
  end
end
