class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
