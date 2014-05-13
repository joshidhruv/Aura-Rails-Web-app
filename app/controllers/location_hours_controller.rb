class LocationHoursController < ApplicationController
  before_action :set_location_hour, only: [:show, :edit, :update, :destroy]

  # GET /location_hours
  # GET /location_hours.json
  def index
    @locations = Location.
    if @locations.nil?
      @location_hours = LocationHour.all
    else
      @location_hours = LocationHour.find_by(:location_id => :id)
    end
  end

  # GET /location_hours/1
  # GET /location_hours/1.json
  def show
  end

  # GET /location_hours/new
  def new
    @location_hour = LocationHour.new
  end

  # GET /location_hours/1/edit
  def edit
  end

  # POST /location_hours
  # POST /location_hours.json
  def create

    puts "************************************"+ location_hour_params.to_s
    @location_hour = LocationHour.new(location_hour_params)

    respond_to do |format|
      if @location_hour.save
        format.html { redirect_to @location_hour, notice: 'Location hour was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location_hour }
      else
        format.html { render action: 'new' }
        format.json { render json: @location_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_hours/1
  # PATCH/PUT /location_hours/1.json
  def update
    respond_to do |format|
      if @location_hour.update(location_hour_params)
        format.html { redirect_to @location_hour, notice: 'Location hour was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_hours/1
  # DELETE /location_hours/1.json
  def destroy
    @location_hour.destroy
    respond_to do |format|
      format.html { redirect_to location_hours_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_hour
      @location_hour = LocationHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_hour_params
      params[:location_hour].permit(:day_of_week, :open, :close, :location_id)
    end
