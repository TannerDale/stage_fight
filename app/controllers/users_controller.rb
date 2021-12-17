class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :password_digest)
  end
end
