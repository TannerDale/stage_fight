class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      sessions[:user_id] = user.id

      redirect_to dashboard_path, notice: 'Successfully logged in!'
    else
      redirect_to login_path, alert: 'Incorrect email or password, try again.'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, success: 'Logged out!'
  end
end
