class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.order('created_at DESC')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "New post created successfully."
      redirect_to admin_root_path
    else
      flash[:alert] = "There was an error creating your post."
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully."
      redirect_to admin_root_path
    else
      flash[:alert] = "There was an error updating your post."
      render "edit"
    end
  end
end
