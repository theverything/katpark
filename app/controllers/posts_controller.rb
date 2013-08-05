class PostsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
    respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
  end

  def show
    @post = Post.find_by_slug(params[:id])
  end
end
