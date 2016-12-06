class ImagesController < ApplicationController
  def create
    @image = Image.create(image_params)
    if @image.save
      redirect_to user_profile_path(current_user)
    else
      flash[:notice]
    end
  end

  private

  def image_params
    params.require(:image).permit(:file)
  end
end
