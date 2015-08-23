class StaticPagesController < ApplicationController
  def home
    if logged_in?
      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
