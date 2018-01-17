class NoticeRepliesController < ApplicationController
  before_action :set_notice_reply, only: [:destroy]
  before_action :authenticate_user!  
  def create
    @notice_reply = NoticeReply.new
    @notice_reply.content = params[:notice_reply_content]
    @notice_reply.user = current_user
    @notice_reply.notice_id = params[:notice_id].to_i
    @notice_reply.save
    # 레이아웃 호출하지 않기
    render layout: false
    flash[:notice] = "댓글이 작성 되었습니다."
  end

  def destroy
      @notice_id = @notice_reply.user_id
      @notice_reply.destroy

      flash[:notice] = "삭제 되었습니다."
      redirect_to "/notices/show/#{@notice_id}"

  end

    private
	    # Use callbacks to share common setup or constraints between actions.
    def set_notice_reply
      @notice_reply = NoticeReply.find(params[:id])
    end
end