class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!

    if @user.save
      flash[:success] = 'Account created Successfully!'
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      flash.now.alert = 'Couldn/t create account. Please use a valid email or password.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :bio, :password_digest)
  end
end
