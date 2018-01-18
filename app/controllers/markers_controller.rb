class MarkersController < ApplicationController
  before_action :authenticate_user!

  def new
  	#@box = Box.new
  end

  def create
  	#@box = Box.new(box_params)
  	file = params[:img]
  	content = params[:content]
    user_id = current_user.id
    lon = params[:lon].to_f
    lat = params[:lat].to_f
    placeName = params[:placeName]
    address = params[:address]
    classification = params[:classification]

  	uploader = DispatchUploader.new(current_user)
    # uploader.store_dir = uploader.store_dir(current_user.id)
    uploader.store!(file)
    # uploader.retrieve_from_store! ( ' my_file.png ' )
    
    Marker.create!(img: uploader.url, address: address, content: content, user_id: user_id, lon: lon, lat: lat, placeName: placeName, classification: classification)

    flash[:notice] = "전송되었습니다."

    @Markers = Marker.all 
    redirect_to '/'

  end

  def showSpec
    @marker = Marker.find(params[:id])
  end

  def edit
    @marker = Marker.find(params[:id])
  end

  def update
    @marker = Marker.find(params[:id])
    content = params[:content]
    address = params[:address]
    user_id = current_user.id
    lon = params[:lon].to_f
    lat = params[:lat].to_f
    placeName = params[:placeName]
    classification = params[:classification]
    #@box = Box.new(box_params)
    if params[:img]
      file = params[:img]
      uploader = DispatchUploader.new(current_user)
      # uploader.store_dir = uploader.store_dir(current_user.id)
      uploader.store!(file)
      # uploader.retrieve_from_store! ( ' my_file.png ' )
      @marker.update!(img: uploader.url, address: address, content: content, user_id: user_id, lon: lon, lat: lat, placeName: placeName, classification: classification)

    else
      @marker.update!(content: content, address: address, user_id: user_id, lon: lon, lat: lat, placeName: placeName, classification: classification)

    end
  
    flash[:notice] = "전송되었습니다."

    @Markers = Marker.all 
    redirect_to '/'
  end

  def destroy
    @marker= Marker.find(params[:id])
    @marker.destroy
    redirect_to '/'

  end

end
