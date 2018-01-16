class FollowersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@markers = Marker.all
  	@user = User.where(state: true).all
  	@user = @user.sample

  	@like = Follower.find_by(user_id: @user.id, follower: current_user.id)
     
    if @like
     	@val = "true"
    else
     	@val = "false"
    end
  end
  
  def like
  	user_id = params[:user_id]
  	@like = Follower.find_by(user_id: user_id, follower: current_user.id)

  	if @like
  		@like.destroy
      @val2 = "false"
  	else
  		Follower.create!(user_id: user_id, follower: current_user.id)
      @val2 = "true"
  	end

    render layout: false
	
  end

  def rank
  	@list = User.find_by_sql(['SELECT DISTINCT email, COUNT("followers".user_id) AS count
      FROM "users" INNER JOIN "followers" 
      ON "users".id = "followers".user_id
      GROUP BY "followers".user_id'])    
	end

  def search_follower
  	@followee = Follower.where(user_id: current_user.id) # 내가 좋아함
  	@follower = Follower.where(follower: current_user.id) # 나를 좋아함
  	
  end

  def search_user
 
  end

  def search
    @user_email = params[:user_email]
    @user_id = params[:user_id]
    @markers = Marker.all
    # @user = User.find_by(email: @user_email)
    @user = User.find(@user_id)
    @like = Follower.find_by(user_id: @user.id, follower: current_user.id)
     
    if @like
      @val = "true"
    else
      @val = "false"
    end
  end

  def destroy

    @user_followers = Follower.where(follower: current_user.id)
    @user_follwers.each do |follower|
      follower.destroy
    end

    @user = User.find(current_user.id)
    @user.destroy

      
  end
end
