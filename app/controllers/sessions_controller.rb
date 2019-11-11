class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to events_path
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to users_path
  end
end
