class NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def new
  end

  def create
    @notice = Notice.new
    @notice.user_id = current_user.id
    @notice.title = params[:title]
    @notice.content = params[:content]

    @notice.save

    redirect_to posts_path

  def show
  end


  end

  def edit
  end

  def update
    @notice.title = params[:title]
    @notice.content = params[:content]

    @notice.save

    redirect_to posts_path
  end

  def destroy
    @notice.destroy
    redirect_to posts_path
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_notice
    @notice = Notice.find(params[:id])
  end

end
