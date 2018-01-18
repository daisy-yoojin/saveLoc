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
  	# @list = User.find_by_sql(['SELECT DISTINCT email, COUNT("followers".user_id) AS count
   #    FROM "users" INNER JOIN "followers" 
   #    ON "users".id = "followers".user_id
   #    GROUP BY "followers".user_id'])
   #  puts @list.inspect
   #  @followee = Follower.where(user_id: current_user.id) # 내가 좋아함
   #  puts @followee.inspect
   #  puts @list.class
   #  @list = User.find_by_sql(['SELECT DISTINCT email, COUNT("followers".user_id) AS count
   #    FROM "users" INNER JOIN "followers" 
   #    ON "users".id = "followers".user_id
   #    GROUP BY "followers".user_id']).page(params['page']).per(4)
    @list= Follower.group(:user_id).count
    @sort = @list.sort_by {|_key, value| value}
    @result = @sort.reverse.to_h 
    @array = Array.new
    @result.each do |key, value|
      @array << key

    end
    @per_number = 10
    @user = Kaminari.paginate_array(@array).page(params[:page]).per(@per_number)

    # @user = User.where(id: array).page(params[:page]).per(1)
    @page = params[:page].to_i
    if @page and @page != 0
      @num = 1+(@per_number*(@page-1))
    else
      @num = 1
    end

    #@list = Follower.joins(:users).select('email, COUNT("followers".user_id) AS count').distinct.group('followers".user_id').page(params['page']).per(1)
	 
  end


  def search_follower
  	@followee = Follower.where(user_id: current_user.id).page(params['page']).per(5) # 내가 좋아함
  	@follower = Follower.where(follower: current_user.id).page(params['page']).per(5) # 나를 좋아함
  	
  end
  def search_followee
    @followee = Follower.where(user_id: current_user.id).page(params['page']).per(5) # 내가 좋아함
    @follower = Follower.where(follower: current_user.id).page(params['page']).per(5) # 나를 좋아함
    
  end

  def search_user
 
  end

 def search
    if params[:user_email]
      @user_email = params[:user_email]
      @user = User.find_by(email: @user_email)
    else
      @user_id = params[:user_id]
      @user = User.find(@user_id)
    end

    if @user.nil?
      redirect_to :back

    
    else  
      @markers = Marker.where(user_id: @user.id)
      @like = Follower.find_by(user_id: @user.id, follower: current_user.id)
       
      if @like
        @val = "true"
      else
        @val = "false"
      end
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
