class PostRepliesController < ApplicationController
  before_action :set_post_reply, only: [:edit, :update, :destroy]
  before_action :authenticate_user!  
  def create
    @post_reply = PostReply.new
    @post_reply.content = params[:post_reply_content]
    @post_reply.user = current_user
    @post_reply.post_id = params[:post_id].to_i
    @post_reply.save
    # 레이아웃 호출하지 않기
    render layout: false
    flash[:notice] = "댓글이 작성 되었습니다."
  end

  def destroy
      @post_id = @post_reply.post_id
      @post_reply.destroy

      flash[:notice] = "삭제 되었습니다."
      redirect_to post_path(@post_id)
  end

    private
	    # Use callbacks to share common setup or constraints between actions.
	    def set_post_reply
	      @post_reply = PostReply.find(params[:id])
	    end
end
