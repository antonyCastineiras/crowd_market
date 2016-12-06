class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.user = current_user
    if @image.save
      flash[:notice] = "Success"
      redirect_to user_profile_path(current_user)
    else
      flash[:notice] = "Unable to save image"
      redirect_to user_profile_path(current_user)
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
