class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]

  def show; end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:success] = 'Account created successfully!'
      session[:user_id] = user.id

      redirect_to dashboard_path
    else
      flash.now.alert = format_errors(user)
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end
