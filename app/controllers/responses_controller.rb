class ResponsesController < ApplicationController
  class ResponsesController < ApplicationController
    def create
      @micropost =Micropost.find(params[:micropost_id])
      @response = @micropost.responses.build(response_params)
      @response.user_id = current_user.id
      if @response.save
        flash[:success] = "レスが投稿されました"
        redirect_to @micropost
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
end
