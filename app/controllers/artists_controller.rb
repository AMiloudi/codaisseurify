class ArtistsController < ApplicationController
  before_action :display_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artist = Artist.all
  end

  def show
    @song = @artist.songs.create
    @photos = @artist.photos
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      image_params.each do |image|
        @artist.photos.create(image: image)
      end

      redirect_to controller: 'artists', action: 'index', notice: "Your artist has been succesfully created"
    else
      render :new
    end
  end

  def edit
    @photos = @artist.photos
  end

  def update
    if @artist.update(artist_params)
      image_params.each do |image|
        @artist.photos.create(image: image)
      end

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

  def image_params
    params[:images].present? ? params.require(:images) : []
  end

end
