class Api::ArtistsController < Api::BaseController

  def index
    render status: 200, json: {
      artists: Artist.all
    }.to_json
  end


  def show
    artist = Artist.find(params[:id])

    render status: 200, json: artist.as_json(include: :songs)
  end


  def create
    artist = Artist.new(artist_params)

    if artist.save
      render status: 201, json: {
        message: "Artist successfully created",
        artist: artist
      }.to_json
    else
      render status: 422, json: {
        errors: artist.errors
      }.to_json
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy

    render status: 200, json: {
      message: "Artist successfully deleted"
    }.to_json
  end

  def update
    artist = Artist.find(params[:id])
    if artist.update(artist_params)
      render status: 200, json: {
        message: "Artist successfully updated",
        artist: artist
      }.to_json
    else
      render status: 422, json: {
        message: "The artist could not be updated",
        errors: artist.errors
      }.to_json
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :genre )
  end
end
