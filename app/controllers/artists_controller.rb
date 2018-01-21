class ArtistsController < ApplicationController

  def index
    @artist = current_user.artist.all
  end

  def show;end

  def new
    @artist = current_user.artist.create
  end

  def create
    @artist = current_user.artist.build(artist_params)

    if @artist.save
      redirect_to @artist, notice: "Your artist has been succesfully created"
    else
      render :new
    end
  end

  def edit;end

  def update
    if @artist.update(artist_params)
      redirect to @atist, notice: "Your artist has been succesfully updated"
    else
      render :edit
    end
  end


  def destroy
    @artist.destroy
    redirect_to @artist, notice:"You have succesfully deteled the artist"
  end


  private

  def display_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :genre)
  end
end
