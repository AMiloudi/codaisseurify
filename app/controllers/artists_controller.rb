class ArtistsController < ApplicationController
  before_action :display_artist, only: [:show, :edit, :update, :destroy]


  def index
    @artist = Artist.all
  end

  def show;end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to controller: 'artists', action: 'index', notice: "Your artist has been succesfully created"
    else
      render :new
    end
  end

  def edit;end

  def update
    if @artist.update_attributes(artist_params)
      redirect_to @artist, notice: "Your artist has been succesfully updated"
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
