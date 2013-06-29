class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    @image = Image.new
    respond_to do |format|
      format.html
      format.js # add this line for your js template
    end
  end

  def new
  end

  def create
    @images = Image.all
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Image has been uploaded."
      redirect_to admin_images_path
    else
      flash[:alert] = "There was a problem uploading the image."
      render "index"
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.avatar.destroy
      @image.destroy
      flash[:notice] = "Image has been deleted."
      redirect_to admin_images_path
    else
      flash[:alert] = "There was a problem deleting the image."
      redirect_to admin_images_path
    end
  end
end
