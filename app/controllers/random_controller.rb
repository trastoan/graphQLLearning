class RandomController < ApplicationController
  def execute 
  	@artist = Artist.find(1)
  	render json: @artist 
  end
end
