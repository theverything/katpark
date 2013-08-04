class Admin::AdminsController < Admin::BaseController
  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Your profile was updated successfully."
      redirect_to admin_root_path
    else
      flash[:alert] = "There was an error updating your profile."
      render "edit"
    end
  end

  def edit_password
    @admin = Admin.find(params[:id])
  end

  def update_password
    @admin = Admin.find(params[:id])
    if @admin.update_with_password(params[:admin])
      flash[:notice] = "Your password was updated successfully."
      sign_in @admin, :bypass => true
      redirect_to admin_root_path
    else
      flash[:alert] = "There was an error updating your password."
      render "edit_password"
    end
  end
end
