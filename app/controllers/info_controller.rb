class InfoController < ApplicationController
  before_action :authenticate_user!
  def edit
  	@user = User.find(current_user.id)
  end
  def update
  	@user = User.find(current_user.id)
  	@mapopen = params[:state]
  	if @state == "true"
  		@user.state = true
  	else 
  		@user.state = false
  	end
  	@user.save

  	redirect_to '/'
  end
end
