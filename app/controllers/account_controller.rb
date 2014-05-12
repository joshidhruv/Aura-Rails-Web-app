class AccountController < ApplicationController
  before_filter :authenticate_user!
  def MyAccount

  end

  def index

  end

  def listStaff
    @staffs = User.where company_id: current_user.company_id
  end



  # GET /account/staff/edit/:id
  def editStaff
    if params[:id].nil?
      # new user, build from scratch
      @staff = User.new
      @staff.company_id = current_user.company_id #set to same company as admin
      @staff.role_id = 2 # set to 'staff' role by default
    else
      # existing user, look it up
      @staff = User.find(params[:id])
    end

    @roles = Role.all

  end

  # POST /account/staff/create
  def createStaff

    @staff = User.new(staff_params)
    @staff.company_id = current_user.company_id

    password_length = 8
    password = Devise.friendly_token.first(password_length)
    @staff.password = password

    @staff.color = User.pickColor(@staff.company_id)

    respond_to do |format|
      if @staff.save
        format.html { redirect_to '/account/staff', notice: 'Staff member was successfully added with password: '+password }
        #format.json { render action: '/account/staff', status: :created, location: @addon }
      else
        format.html { render action: 'editStaff' }
        #format.json { render json: @addon.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /account/staff/edit/:id
  def updateStaff
    respond_to do |format|
      # get the current record
      @staff = User.find(params[:id])

      # attempt to save the record
      if @staff.update_attributes(staff_params)
        format.html { redirect_to :account_staff_edit, notice: 'Staff member was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render action: 'editStaff' }
        #format.json { render json: @addon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addons/1
  # DELETE /addons/1.json
  def destroyStaff
    # get the current record
    @staff = User.find(params[:id])
    @deleted_name = @staff.fullname
    # delete
    @staff.destroy

    respond_to do |format|
      format.html { redirect_to '/account/staff', notice: 'Staff member ' + @deleted_name + ' was successfully deleted.' }
      #format.json { head :no_content }
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you
  # can specialize this method with per-user checking of permissible attributes.
  def staff_params
    params.require(:user).permit(:first_name, :last_name, :email, :role_id)
  end

end
