class Admin::PostsController < Admin::BaseController
  def index
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
  end
end
