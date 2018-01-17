class InfoController < ApplicationController
  before_action :authenticate_user!
  def edit
  	@user = User.find(current_user.id)
  end
  def update
  	@user = User.find(current_user.id)
  	@state = params[:state]
  	if @state == "true"
  		@user.state = true
  	else 
  		@user.state = false
  	end
  	@user.save

  	redirect_to '/'
  end
   def destroy

    @user_follower = Follower.where(follower: current_user.id)
    @user_follower.each do |follower|
      follower.destroy
    end

    @user = User.find(current_user.id)
    @user.destroy

    redirect_to '/'

      
  end
end
