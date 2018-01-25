class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    @artist = photo.room
    photo.destroy

    redirect_to edit_artist_path(@room), notice: "Photo successfully removed"
  end
end
