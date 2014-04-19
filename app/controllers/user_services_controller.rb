class UserServicesController < ApplicationController
  before_action :set_user_service, only: [:show, :edit, :update, :destroy]

  # GET /user_services
  # GET /user_services.json
  def index
    @user_services = UserService.all
  end

  # GET /user_services/1
  # GET /user_services/1.json
  def show
  end

  # GET /user_services/new
  def new
    @user_service = UserService.new
  end

  # GET /user_services/1/edit
  def edit
  end

  # POST /user_services
  # POST /user_services.json
  def create
    @user_service = UserService.new(user_service_params)

    respond_to do |format|
      if @user_service.save
        format.html { redirect_to @user_service, notice: 'User service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_services/1
  # PATCH/PUT /user_services/1.json
  def update
    respond_to do |format|
      if @user_service.update(user_service_params)
        format.html { redirect_to @user_service, notice: 'User service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_services/1
  # DELETE /user_services/1.json
  def destroy
    @user_service.destroy
    respond_to do |format|
      format.html { redirect_to user_services_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_service
      @user_service = UserService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_service_params
      params[:user_service]
    end
end
