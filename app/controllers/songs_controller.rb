class SongsController < ApplicationController
  before_action :display_song, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @song = current_user.artist.songs.all
  end

  def show;end

  def new
    @song = current_user.artist.songs.create
  end

  def create
    @song = current_user.artist.songs.build(song_params)

    if @song.save
      redirect_to @song, notice: "Your song has been succesfully created"
    else
      render :new
    end
  end

  def edit;end

  def update
    if @song.update(song_params)
      redirect to @song, notice: "Your song has been succesfully updated"
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to @song, notice:"You have succesfully deteled the song"
  end

  private

  def display_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :released_year)
  end
end
