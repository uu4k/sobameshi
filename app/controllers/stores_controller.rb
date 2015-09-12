class StoresController < ApplicationController
  def list
    lat = params[:latitude]
    lng = params[:longitude]
    @stores = Store.location_items(lat,lng).order(created_at: :desc)
    
    render json: @stores
  end
end
