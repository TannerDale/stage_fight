class UsersController < ApplicationController
  before_action :authorize, except: %i[new create]

  def show; end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id

      redirect_to dashboard_path, success: 'Account created successfully!'
    else
      redirect_to new_users_path, alert: format_errors(user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end
