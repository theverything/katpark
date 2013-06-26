class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Image has been uploaded."
      redirect_to admin_images_path
    else
      flash[:alert] = "There was a problem uploading the image."
      render "new"
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
