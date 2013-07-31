class Admin::PostsController < Admin::BaseController
  before_filter :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def show
  end

  def new
    @post = Post.new
    @images = Image.order('created_at DESC').limit(5)
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
    @images = Image.order('created_at DESC').limit(5)
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post updated successfully."
      redirect_to admin_root_path
    else
      flash[:alert] = "There was an error updating your post."
      render "edit"
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was deleted."
    redirect_to admin_root_path
  end

  private
  def find_post
    @post = Post.find(params[:id])
  end
end
