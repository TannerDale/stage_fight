class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create welcome]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to login_path
    end
  end

  def login
  end

  def welcome
  end

  def page_requires_login
  end
end
