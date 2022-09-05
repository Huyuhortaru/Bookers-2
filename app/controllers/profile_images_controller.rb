class ProfileImagesController < ApplicationController
  def new
    @profile_image = ProfileImage.new
  end
  
  def create
    @profile_image = ProfileImage.new(profile_image_params)
    @profile_image.user_id = current_user.id
    @profile_image.save
    redirect_to profile_images_path
  end

  def index
  end

  def show
  end
  
  private

  def profile_image_params
    params.require(:profile_image).permit(:name, :image, :introduction)
  end
end
