class MicropostsController < ApplicationController
  before_action :logged_in_user,  only: [:show, :create, :destroy]
  before_action :correct_user, only: :destroy

  def show
    @micropost = Micropost.find(params[:id])
    @response = Response.new
    @responses = @micropost.responses.order(created_at: :asc)
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿されました"
      redirect_to root_url
    else
      @feed_items = current_user.feed.page(params[:page]).per(20)
      render 'sessions/new'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to request.referrer || root_url
  end

  private
  
  def micropost_params
    params.require(:micropost).permit(:title, :file)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id:params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
