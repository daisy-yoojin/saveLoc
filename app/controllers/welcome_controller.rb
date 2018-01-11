class WelcomeController < ApplicationController

  def index
  	@markers = Marker.all
  end

end
