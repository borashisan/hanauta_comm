class SessionsController < ApplicationController
  def new
    @micropost = current_user.microposts.build if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or user
    else
      flash.now[:danger] = "invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
