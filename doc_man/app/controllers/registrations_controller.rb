class RegistrationsController < Devise::RegistrationsController
 skip_before_filter :require_no_authentication, only: [:new, :create]
 before_filter :authenticate_user!
 before_filter :is_signed_in?, only: [:new, :create]

 def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
     redirect_to :root, notice: 'User created successfully.'
    else
     render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def is_signed_in?
  if user_signed_in? # if user signed
    true
  else
    respond_to do |format|
      format.html { redirect_to new_user_session_path, alert: 'You need to be signed in to create new users.' }
    end
  end
  end
end
