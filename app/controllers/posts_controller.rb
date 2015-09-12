class PostsController < ApplicationController
  before_action :logged_in_user
  
  def new
    @type = "New"
    @post = Post.new
    @post.build_store
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
    if !@post
      redirect_to root_url
    end
  end
  
  def create
    @type = "New"
    @post = current_user.posts.build(post_params)
    if store_id = params[:post][:store_attributes][:id] && !store_id.nil?
      store = Store.find(store_id)
      @post.store = store
    end
    if @post.save
      flash[:success] = t(:post_created)
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def update
    @post = current_user.posts.build(post_params)
    if @post.update_attributes(post_params)
      flash[:success] = t(:post_updated)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = current_user.posts.find_by(id: params[:id])
    return redirect_to root_url if @post.nil?
    @post.destroy
    flash[:success] = t(:post_deleted)
    # TODO post/showからの削除はroot_urlにリダイレクト
    redirect_to request.referrer || root_url
  end
  
  private
  def post_params
    params.require(:post).permit(:content,:image,:latitude,:longitude,:address,:place_id, store_attributes: [:name, :latitude, :longitude, :address, :place_id])
  end
end
