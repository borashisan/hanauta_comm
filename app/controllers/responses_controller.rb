class ResponsesController < ApplicationController
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @response = @micropost.responses.build(response_params)
    @responses = @micropost.responses.order(created_at: :asc)
    @response.user_id = current_user.id
    
    
    @response.response_id = @responses.empty? ? 1 
                          : @responses[-1].response_id + 1
    
    
    if @response.save
      flash[:success] = "レスが投稿されました"
      redirect_to @micropost
    else
      @responses = @micropost.responses.order(created_at: :asc)
      render 'microposts/show'
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    flash[:success] = "レスが削除されました"
    redirect_to request.referrer || root_url
  end

  private

  def response_params
    params.require(:response).permit(:content, :micropost_id, :user_id)
  end
end

