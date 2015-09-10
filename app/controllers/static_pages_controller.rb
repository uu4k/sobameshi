class StaticPagesController < ApplicationController
  protect_from_forgery except: :home
  def home
    @type = params[:type] || "Here"
    @feed_items = []
    case @type
    when "Here" then
      lat = params[:latitude]
      lng = params[:longitude]
      @feed_items = Post.location_items(lat,lng).order(created_at: :desc).page(params[:page]) if lat && lng
    when "Friends" then
      if logged_in?
        @feed_items = current_user.feed_items.order(created_at: :desc).page(params[:page])
      else
        return logged_in_user
      end
    when "All" then
      @feed_items = Post.order(created_at: :desc).page(params[:page])
    else
      # @feed_items = Post.order(created_at: :desc).page(params[:page])
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
