class RegistrationsController < Devise::RegistrationsController
  def new
    @companies = Company.all.sort_by{|e| e[:nombre]}
    super
  end

  def create
    @companies = Company.all.sort_by{|e| e[:nombre]}
    @user = User.new(email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation],last_name: params[:user][:last_name],first_name: params[:user][:first_name],permission_level: params[:user][:permission_level])
    @user.company = Company.find(params[:user][:company])

    if @user.save
      if @user.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(:user, @user)
        respond_with @user, :location => after_sign_up_path_for(@user)
      else
        set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with @user, :location => after_inactive_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      respond_with @user
    end
  end
    private
end 