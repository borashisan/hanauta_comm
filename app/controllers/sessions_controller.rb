class SessionsController < ApplicationController
  def new
    if logged_in?
      @micropost = current_user.microposts.build if logged_in?
      @feed_items = current_user.feed.page(params[:page]).per(20)
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        redirect_back_or user
      else
        message = "アカウントが有効化されていません"
        message += "メールを確認してアカウントを有効化してください"
        flash[:warning] = message
        redirect_to root_url
      end
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
