class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to dashboard_path, success: 'Account created successfully!'
    else
      render :new, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :password, :password_confirmation)
  end
end
