class LocationsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.where company_id: current_user.company_id

  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    # build from scratch
    @location = Location.new
    @location.company_id = current_user.company_id #set to same company as admin
    @days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]

    @hours = LocationHour.business_hours
    default_open = "9:00am"
    default_close = "5:00pm"

    @location.location_hours = [
        LocationHour.new(day_of_week: "Monday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Tuesday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Wednesday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Thursday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Friday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Saturday", open: default_open, close: default_close),
        LocationHour.new(day_of_week: "Sunday", open: default_open, close: default_close),
    ]
  end

  # GET /locations/1/edit
  def edit

      # existing user, look it up
      @location = Location.find(params[:id])

      @days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]

      @hours = LocationHour.business_hours

  end

  # POST /locations
  # POST /locations.json
  def create
    # build new model
    @location = Location.new(location_params)
    # assign company_id
    @location.company_id = current_user.company_id.to_i

    respond_to do |format|
      # save Location
      if @location.save
        format.html { redirect_to :list_account_locations_path, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    # get the current record
    @location = Location.find(params[:id])

    respond_to do |format|
      # save Location from params
      @location.update_attributes(location_params)
      if @location.save
        format.html { redirect_to :list_account_locations_path, notice: 'Location was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      if !params[:id].nil?
        @location = Location.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params[:location].permit(:name, :address1, :address2, :city, :state, :zip, :email, :phone, :primary, :location_hours_attributes => [ :id, :day_of_week, :open, :close, :closed ])
    end

    def location_hours_params
      params[:location][:location_hours_attributes]
    end
end
