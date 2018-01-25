class Api::SongsController < Api::BaseController
  before_action :set_artist

  def create
    song = @artist.songs.new(song_params)

    if song.save
      render status: 200, json: {
        message: "Song successfully created",
        artist: @artist,
        song: song
      }.to_json
    else
      render status: 422, json: {
        message: "Song could not be created",
        errors: song.errors
      }.to_json
    end
  end

  private

def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:title, :released_year)
  end
end
