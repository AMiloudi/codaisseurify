class SongsController < ApplicationController
  before_action :display_song, only: [:show, :edit, :update]

  def index
    @artist = Artist.find(params[:artist_id])
    redirect_to controller: 'artists', action: 'show', id: @artist.id
  end

  def show;end

  def new
    @artist = Artist.find(params[:artist_id])

    @song = @artist.songs.create
  end

  def create
    @song = @artist.songs.build(song_params)
    @artist = Artist.find(params[:artist_id])

    if @song.save
      redirect_to controller: 'artists', action: 'show', id: @artist.id, notice: "Your song has been succesfully created"
    else
      redirect_to controller: 'artists', action: 'show', id: @artist.id, notice: "Please fill in all the fields"
    end
  end

  def edit;end

  def update
    @artist = Artist.find(params[:artist_id])
    if @song.update(song_params)
      redirect_to controller: 'artists', action: 'show', id: @artist.id, notice: "Your song has been succesfully updated"
    else
      render :edit
    end
  end

  def destroy
    @artist = Artist.find(params[:artist_id])

    @song = Song.find(params[:id])

    @song.destroy
    redirect_to controller: 'artists', action: 'show', id: @artist.id,  notice:"You have succesfully deteled the song"
  end

  private

  def display_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released_year, :artist_id)
  end
end
