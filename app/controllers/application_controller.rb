class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  #ユーザーログインを確認する
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインしてください"
      redirect_to root_url
    end
  end
end
